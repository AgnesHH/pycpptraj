# distutils: language = c++

cimport cython
from cython cimport view
from cpython.array cimport array as pyarray
from cython.operator cimport dereference as deref
from libcpp.vector cimport vector
from cpython.buffer cimport Py_buffer
from pycpptraj.decorators import for_testing, iter_warning

def check_instance(inst, clsname):
    if not isinstance(inst, clsname):
        raise ValueError("Must be instance of %s") % clsname.__name__

cdef class Frame (object):
    """Original cpptraj doc (Frame.h) (written by Daniel R. Roe)
    (pycpptraj doc will be updated) 
    Class: Frame
        Hold coordinates, perform various operations/transformations on them.
        Intended to hold coordinates e.g. from a trajectory or reference frame,
        along with box coordinates (used in imaging calculations), mass information,
        and optionally velocity information. Frame can be set up coords only (all 
        masses set to 1.0), coords and masses, or coords/masses/velocities. Mass is 
        stored since several functions (like COM, RMSD, Inertia etc) have the option
        to factor in the mass of the atoms involved, and this avoids having to pass
        a mass pointer in, which takes the burden of keeping track of mass away from 
        actions etc. Mass is stored when the frame is initially created, and is 
        modified if necessary by SetFrame (which is the case when e.g. calculating
        per-residue RMSD).
        
        - Implementation Details:
        
        In addition to the constructors, there are two classes of routine that
        can be used to set up Frames. The SetupX routines do any memory allocation,
        and assign masses, and the SetX routines assign coordinates/velocities. The
        SetX routines will dynamically adjust the size of the frame up to maxnatom,
        but no reallocation will occur so the frame should be set up for the largest
        possible # of atoms it will hold. This avoids expensive reallocations.
        The representation of coordinates (X) and velocities (V) are double*
        instead of STL vectors so as to easily interface with the FileIO routines
        which tend to be much faster than iostream ops. 

        pycpptraj doc
        ============
        Should Frame hold topology info? (may be NOT, it's expesive)
        TODO : should we really need all methods here?
    """
    def __cinit__(self, *args):
        # Should I include topology in Frame?
        # May by not: memory
        # Include topology in Trajectory instance? 
        """
        TODO: add doc
        >>> from pycpptraj.Frame import Frame
        >>> # created empty Frame instance
        >>> frame0 = Frame()
        >>> # create Frame instance with 304 atoms
        >>> frame1 = Frame(304)
        >>> # create a copy of frame1
        >>> frame2 = Frame(frame1)
        >>> # add more examples
        """
        cdef Frame frame
        cdef AtomMask atmask
        cdef vector[_Atom] vt
        cdef Topology top
        cdef Atom at
        cdef list atlist
        cdef int natom

        self.py_free_mem = True

        if not args:
            self.thisptr = new _Frame()
        else:
            if len(args) == 2:
                frame, atmask = args
                self.thisptr = new _Frame(frame.thisptr[0], atmask.thisptr[0])
            elif len(args) == 1:
                # copy Frame
                if isinstance(args[0], Frame):
                    frame = args[0]
                    self.thisptr = new _Frame(frame.thisptr[0])
                # creat a new Frame instance with natom
                elif isinstance(args[0], (int, long)):
                    natom = <int> args[0]
                    self.thisptr = new _Frame(natom)
                #elif isinstance(args[0], Topology):
                #    top = <Topology> args[0]
                #    # get Command terminated error
                #    self.thisptr.SetupFrameV(top.thisptr.Atoms(), False, 0)
                else:
                    # Create Frame from list of atom mask
                    atlist = args[0]
                    for at in atlist:
                        vt.push_back(at.thisptr[0])
                    self.thisptr = new _Frame(vt)
            else:
                raise ValueError()

    def __dealloc__(self):
        if self.py_free_mem and self.thisptr:
            del self.thisptr

    def same_coords_as(self, Frame other):
        """check if two frames having the same coords"""
        return (self.coords == other.coords)

    def copy(self):
        """return a copy"""
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0]
        return frame

    def is_empty(self):
        return self.size == 0

    def set_from_crd(self, CRDtype farray, *args):
        """"""
        cdef int numCrd, numBoxCrd
        cdef bint hasVel
        cdef AtomMask mask

        if len(args) == 3:
            numCrd, numBoxCrd, hasVel = args
            self.thisptr.SetFromCRD(farray, numCrd, numBoxCrd, hasVel)
        elif len(args) == 4:
            mask, numCrd, numBoxCrd, hasVel = args
            self.thisptr.SetFromCRD(farray, mask.thisptr[0], numCrd, numBoxCrd, hasVel)
        else:
            # TODO : shape checking
            numCrd = len(farray)
            self.thisptr.SetFromCRD(farray, numCrd, 0, False)

    # don't need this method since we have self.coords_copy()
    #def convert_to_crd(self, int num_box_crd=0, bint has_vel=False):
    #    """convert_to_crd(self, int num_box_crd=0, bint has_vel=False):
    #    TODO : do we need this method?
    #    """
    #    return self.thisptr.ConvertToCRD(num_box_crd, has_vel)
        
    # don't need this since we can use `print self.xyz(atom_num)`
    #def print_atom_coord(self, int atom):
    #    """"""
    #    self.thisptr.printAtomCoord(atom)

    def info(self, char* msg=''):
        self.thisptr.Info(msg)

    def clear_atoms(self):
        self.thisptr.ClearAtoms()

    def add_xyz(self, double[:] xyz):
        self.thisptr.AddXYZ(&xyz[0])

    def add_vec3(self, Vec3 vec):
        self.thisptr.AddVec3(vec.thisptr[0])

    def swap_atoms(self, int atom1, int atom2):
        self.thisptr.SwapAtoms(atom1, atom2)

    def __str__(self):
        tmp = "%s instance with %s atoms. ID = %s" % (
                self.__class__.__name__,
                self.n_atoms,
                hex(id(self))
                )
        return tmp

    def __getitem__(self, idx):
        return self.coords[idx]

    def __setitem__(self, idx, value):
        # TODO : should we use buffer. Kind of dangerous
        self.buffer[idx] = value

    def __iter__(self):
        cdef int i
        for i in range(self.thisptr.size()):
            yield self.thisptr.CRD(i)[0]

    def __len__(self):
        return self.size

    @property
    def buffer(self):
        """return memory view for Frame coordinates
        TODO : rename?
        """
        # debug
        #print "from calling buffer: py_free_mem = ", self.py_free_mem
        # end debug
        def _buffer(N):
            cdef double* ptr = self.thisptr.xAddress()
            cdef view.array my_arr
            my_arr = <double[:N]> ptr
            return my_arr
        return _buffer(self.size)
        
    def is_empty(self):
        return self.thisptr.empty()

    def has_vel(self):
        return self.thisptr.HasVelocity()

    @property
    def n_atoms(self):
       return self.thisptr.Natom()

    @property
    def size(self):
        """don't change the name of this method"""
        return self.thisptr.size()

    @property
    def n_repdims(self):
        return self.thisptr.NrepDims()

    @property 
    def temperature(self):
        return self.thisptr.Temperature()

    def update_atom(self, int idx, double[:] xyz):
        cdef double* ptr = self.thisptr.xAddress() + 3 * idx
        if len(xyz) > 3:
            raise IndexError("")
        ptr[0] = xyz[0]
        ptr[1] = xyz[1]
        ptr[2] = xyz[2]

    def update_atoms(self, indices, xyz):
        """TODO: add doc"""
        if len(indices) != len(xyz)/3:
            raise ValueError("TODO: add doc")
        self._update_atoms(pyarray('i', indices), pyarray('d', xyz), len(indices))

    @cython.boundscheck(False)
    @cython.wraparound(False)
    cdef _update_atoms(self, int[:] indices, double[:] xyz, int N):
        """Update atom coordinates with indices and given xyz array
        Parameters:
        ----------
        indices : int[:]
        xyz : double[:]
        N : int (len of indices)
        """
        cdef double* ptr
        cdef int i, idx

        for i in range(N):
            idx = indices[i]
            ptr = self.thisptr.xAddress() + 3 * idx
            ptr[0] = xyz[3*i + 0]
            ptr[1] = xyz[3*i + 1]
            ptr[2] = xyz[3*i + 2]

    def atom_xyz(self, int atomnum):
        """return xyz coordinates of idx-th atom"""
        # return XYZ for atomnum
        # cpptraj: return double*
        # use python array to store double*
        # can we change it?

        cdef int i
        cdef pyarray arr = pyarray('d', [])

        if atomnum >= self.n_atoms or atomnum < 0:
            raise ValueError("Index is out of range")

        # TODO: check if this is not empty Frame
        arr.append(self.thisptr.XYZ(atomnum)[0])
        arr.append(self.thisptr.XYZ(atomnum)[1])
        arr.append(self.thisptr.XYZ(atomnum)[2])
        return arr

    @for_testing
    def coords_copy(self):
        return self.coords

    @property
    def coords(self):
        """
        return a copy of frame coords (python array)
        """
        cdef pyarray arr = pyarray('d', [])
        cdef int i

        for  i in range(3 * self.thisptr.Natom()):
            arr.append(deref(self.thisptr.CRD(i)))
        return arr

    def v_xyz(self, int atnum):
        """return a copy of velocity"""
        cdef int i
        cdef pyarray arr = pyarray('d', [])

        arr.append(self.thisptr.VXYZ(atnum)[0])
        arr.append(self.thisptr.VXYZ(atnum)[1])
        arr.append(self.thisptr.VXYZ(atnum)[2])
        return arr

    def mass(self,int atnum):
        """return `mass` of atnum-th atom"""
        return self.thisptr.Mass(atnum)

    def box_crd(self):
        cdef Box box = Box()
        box.thisptr[0] = self.thisptr.BoxCrd()
        return box

    def v_address(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def get_box(self):
        cdef Box box = Box()
        box.thisptr.SetBox(self.thisptr.bAddress())
        return box

    def t_address(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def i_address(self):
        # cpptraj: return int*
        raise NotImplementedError()

    def set_box_angles(self, double[:] ain):
        self.thisptr.SetBoxAngles(&ain[0])

    #def set_frame_m(self, list atlist):
    #    cdef vector[_Atom] v 
    #    v = atomlist_to_vector(atlist)
    #    return self.thisptr.SetupFrameM(v)

    def set_frame(self, *args):
        cdef int atomnum 
        cdef AtomMask atm
        cdef Frame frame

        if isinstance(args[0], Frame) and isinstance(args[1], AtomMask):
            frame = args[0]
            atm = args[1]
            self.thisptr.SetFrame(frame.thisptr[0], atm.thisptr[0])
        elif isinstance(args, (int, long)):
            atomnum = <int> args[0]
            self.thisptr.SetupFrame(atomnum)

    def set_frame_x_m(self, vector[double] Xin, vector[double] massIn):
        return self.thisptr.SetupFrameXM(Xin, massIn)

    def set_frame_v(self, Topology top, bint has_vel=False, int n_repdims=0):
        """TODO: add doc
        """
        return self.thisptr.SetupFrameV(top.thisptr.Atoms(), has_vel, n_repdims)

    #def set_frame_from_mask(self, AtomMask atmask, list atlist):
    #    cdef vector[_Atom] v = atomlist_to_vector(atlist)
    #    return self.thisptr.SetupFrameFromMask(atmask.thisptr[0], v)

    def set_coord(self, Frame frame, *args):
        cdef AtomMask atmask 
        if not args:
            self.thisptr.SetCoordinates(frame.thisptr[0])
        else:
            atmask = args[0]
            self.thisptr.SetCoordinates(frame.thisptr[0], atmask.thisptr[0])

    def set_coords_by_map(self, Frame frame, vector[int] mapIn):
        self.thisptr.SetCoordinatesByMap(frame.thisptr[0], mapIn)

    def zero_coords(self):
        self.thisptr.ZeroCoords()

    def __iadd__(Frame self, Frame other):
        # += 
        # either of two methods are correct
        #self.thisptr[0] = self.thisptr[0].addequal(other.thisptr[0])
        self.thisptr[0] += other.thisptr[0]
        return self

    def __sub__(Frame self, Frame other):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0] - other.thisptr[0]
        return frame

    def __isub__(Frame self, Frame other):
        # -= 
        # either of two methods are correct
        #self.thisptr[0] = self.thisptr[0].subequal(other.thisptr[0])
        self.thisptr[0] -= other.thisptr[0]
        return self

    def __imul__(Frame self, Frame other):
        # *=
        # either of two methods are correct
        #self.thisptr[0] = self.thisptr[0].mulequal(other.thisptr[0])
        self.thisptr[0] *= other.thisptr[0]
        return self

    def __mul__(Frame self, Frame other):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0] * other.thisptr[0]
        return frame

    def divide(self, double divisor, *args):
        # TODO : check
        cdef Frame frame
        if not args:
            self.thisptr.Divide(divisor)
        else:
            frame = args[0]
            return self.thisptr.Divide(frame.thisptr[0], divisor)

    def add_by_mask(self, Frame frame, AtomMask atmask):
        self.thisptr.AddByMask(frame.thisptr[0], atmask.thisptr[0])

    def check_coords_invalid(self):
        return self.thisptr.CheckCoordsInvalid()

    def VCenterOfMass(self, AtomMask atmask):
        # return Vec3 instance
        cdef Vec3 v3 = Vec3()
        v3.thisptr[0] = self.thisptr.VCenterOfMass(atmask.thisptr[0])
        return v3

    def VGeometricCenter(self, AtomMask atmask):
        # return Vec3 instance
        cdef Vec3 v3 = Vec3()
        v3.thisptr[0] = self.thisptr.VGeometricCenter(atmask.thisptr[0])
        return v3

    def translate(self, *args):
        """
        Args:
               (Vec3, first_atom_idx, last_atom_idx)
            or (Vec3, atom_idx) 
            or (Vec3)
        TODO: add doc
        """
        cdef firstAtom, lastAtom, atom
        cdef Vec3 vec3

        if len(args) == 3:
            vec3, firstAtom, lastAtom = args
            self.thisptr.Translate(vec3.thisptr[0], firstAtom, lastAtom)
        elif len(args) == 2:
            vec3, atom = args
            check_instance(vec3, Vec3)
            self.thisptr.Translate(vec3.thisptr[0], atom)
        elif len(args) == 1:
            vec3 = args[0]
            self.thisptr.Translate(vec3.thisptr[0])
        else:
            raise ValueError()

    def neg_translate(self, Vec3 vec):
        self.thisptr.NegTranslate(vec.thisptr[0])

    def rotate(self, Matrix_3x3 m3, *args):
        cdef AtomMask atmask
        if not args:
            self.thisptr.Rotate(m3.thisptr[0])
        elif len(args) == 1:
            atmask = args[0]
            self.thisptr.Rotate(m3.thisptr[0], atmask.thisptr[0])

    def trans_rot_trans(self, Vec3 vec3, Matrix_3x3 m3, Vec3 vec3_2):
        self.thisptr.Trans_Rot_Trans(vec3.thisptr[0], m3.thisptr[0], vec3_2.thisptr[0])

    def scale(self, AtomMask atm, double sx, double sy, double sz):
        self.thisptr.Scale(atm.thisptr[0], sx, sy, sz)

    def center_on_origin(self,bint useMassIn):
        cdef Vec3 v = Vec3()
        v.thisptr[0] = self.thisptr.CenterOnOrigin(useMassIn)
        return v

    def rmsd(self, Frame frame, bint use_mass=False, *args):
        # TODO : add mask
        """Calculate rmsd betwen two frames
        Parameters:
        ----------
        frame : Frame instance
        use_mass : bool, default = False
        *args :  optional, 3 args (Matrix_3x3 instance, Vec3 instance, Vec3 instance)
        """

        cdef Matrix_3x3 m3
        cdef Vec3 v1, v2

        if not args:
            return self.thisptr.RMSD(frame.thisptr[0], use_mass)
        elif len(args) == 3:
            m3, v1, v2 = args
            return self.thisptr.RMSD(frame.thisptr[0], m3.thisptr[0], v1.thisptr[0], v2.thisptr[0], use_mass)
        else:
            raise NotImplementedError()

    def rmsd_centered_ref(self, Frame ref, bint use_mass=False, *args):
        """Calculate rmsd betwen two frames
        Parameters:
        ----------
        frame : Frame instance
        use_mass : bool, default = False
        *args :  optional, 2 args (Matrix_3x3 instance, Vec3 instance)
        """
        cdef Matrix_3x3 mat 
        cdef Vec3 v

        if not args:
            return self.thisptr.RMSD_CenteredRef(ref.thisptr[0], use_mass)
        else:
            mat, v = args
            return self.thisptr.RMSD_CenteredRef(ref.thisptr[0], mat.thisptr[0], v.thisptr[0], use_mass)

    def rmsd_no_fit(self, Frame frame, bint use_mass=False):
        """Calculate rmsd betwen two frames without fitting
        Parameters:
        ----------
        frame : Frame instance
        use_mass : bool, default = False
        """
        return self.thisptr.RMSD_NoFit(frame.thisptr[0], use_mass)

    def dist_rmsd(self, Frame frame):
        """Calculate dist_rmsd betwen two frames
        Parameters:
        ----------
        frame : Frame instance
        """
        return self.thisptr.DISTRMSD(frame.thisptr[0])

    def set_axis_of_rotation(self, int atom1, int atom2):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.SetAxisOfRotation(atom1, atom2)
        return vec

    def calc_inertia(self, AtomMask atm, Matrix_3x3 Inertia):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.CalculateInertia(atm.thisptr[0], Inertia.thisptr[0])
        return vec

    def calc_temperature(self, AtomMask mask, int deg_of_freedom):
        return self.thisptr.CalcTemperature(mask.thisptr[0], deg_of_freedom)

    # use Action_Strip here?
    cdef void _strip_atoms(Frame self, Topology top, string m, bint update_top, bint has_box):
        """this method is too slow vs cpptraj
        if you use memory for numpy, you need to update after resizing Frame
        >>> arr0 = np.asarray(frame.buffer)
        >>> frame.strip_atoms(top,"!@CA")
        >>> # update view
        >>> arr0 = np.asarray(frame.buffer)
        """

        cdef Topology newtop = Topology()
        newtop.py_free_mem = False
        cdef AtomMask mask = AtomMask()
        cdef Frame tmpframe = Frame() 

        del tmpframe.thisptr

        tmpframe.thisptr = new _Frame(self.thisptr[0])
        
        mask.thisptr.SetMaskString(m)
        mask.thisptr.InvertMask()
        top.thisptr.SetupIntegerMask(mask.thisptr[0])
        #newtop.thisptr[0] = top.thisptr.modifyStateByMask(mask.thisptr[0])
        newtop.thisptr = top.thisptr.modifyStateByMask(mask.thisptr[0])
        if not has_box:
            newtop.thisptr.SetBox(_Box())
        tmpframe.thisptr.SetupFrameV(newtop.thisptr.Atoms(), newtop.thisptr.HasVelInfo(), 
                                     newtop.thisptr.NrepDims()) 
        tmpframe.thisptr.SetFrame(self.thisptr[0], mask.thisptr[0])
        self.thisptr[0] = tmpframe.thisptr[0]
        if update_top:
            top.thisptr[0] = newtop.thisptr[0]

    def strip_atoms(Frame self, string mask, Topology top=Topology(), 
                    bint update_top=False, bint has_box=False):
        """strip_atoms(Frame self, string mask, Topology top=Topology(), 
                       bint update_top=False, bint has_box=False)"""
        self._strip_atoms(top, mask, update_top, has_box)

    def __getbuffer__(self, Py_buffer* viewout, int flags):
        cdef double* ptr = self.thisptr.xAddress()
        cdef view.array my_arr
        my_arr = <double[:<int>self.size]> ptr
        viewout = my_arr
        #pass
        #view.buf = self.buffer.buf
        #view.len = self.buffer.len
        #view.shape = self.buffer.shape
        #view.strides = self.buffer.strides
        #view.readonly = 0
        #view.format = self.buffer.format
        #view.itemsize = self.buffer.itemsize
        #view.ndim = self.buffer.ndim