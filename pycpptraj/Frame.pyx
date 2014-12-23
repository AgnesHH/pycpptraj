# distutils: language = c++

from cpython.array cimport array as pyarray
from cython.operator cimport dereference as deref
from libcpp.vector cimport vector
from AtomMask cimport *
from AtomMask import AtomMask
from Frame cimport CRDtype
from Topology cimport Topology
from Vec3 cimport Vec3
#from util cimport atomlist_to_vector

def check_instance(inst, clsname):
    if not isinstance(inst, clsname):
        raise ValueError("Must be instance of %s") % clsname.__name__

cdef class Frame:
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
        Should Frame hold topology infor?
    """
    def __cinit__(self, *args):
        # Should I include topology in Frame?
        # May by not: memory
        # Include topology in Trajectory instance? 
        cdef Frame frame
        cdef AtomMask atmask
        cdef vector[_Atom] vt
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
            raise ValueError("Must have only 3 or 4 more arguments")

    def convert_to_crd(self, int numBoxCrd, bint hasVel):
        return self.thisptr.ConvertToCRD(numBoxCrd, hasVel)
        
    def print_atom_coord(self, int atom):
        self.thisptr.printAtomCoord(atom)

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

    def __getitem__(self, idx):
        "Return coordinate"
        if idx <= 0:
            raise ValueError("Frame size must be larger than 0")
        else:
            return self.thisptr.index_opr(idx)

    def empty(self):
        return self.thisptr.empty()

    def has_velocity(self):
        return self.thisptr.HasVelocity()

    @property
    def n_atoms(self):
       return self.thisptr.Natom()

    property size:
        def __get__(self):
            return self.thisptr.size()

    property n_repdims:
        def __get__(self):
            return self.thisptr.NrepDims()

    property temperature:
        def __get__(self):
            return self.thisptr.Temperature()

    def xyz(self, int atomnum):
        """return xyz coordinates of idx-th atom"""
        # return XYZ for atomnum
        # cpptraj: return double*
        # use python array to store double*
        # can we change it?

        cdef int i
        cdef natom = self.n_atoms
        cdef pyarray arr = pyarray('d', [])

        # check if this is not empty Frame
        arr.append(self.thisptr.XYZ(atomnum)[0])
        arr.append(self.thisptr.XYZ(atomnum)[1])
        arr.append(self.thisptr.XYZ(atomnum)[2])
        return arr

    def crd(self,int idx):
        cdef int i
        return self.thisptr.CRD(idx)[0]

    def v_xyz(self,int atnum):
        cdef int i
        cdef natom = self.n_atoms
        cdef pyarray arr = pyarray('d', [])

        arr.append(self.thisptr.VXYZ(atnum)[0])
        arr.append(self.thisptr.VXYZ(atnum)[1])
        arr.append(self.thisptr.VXYZ(atnum)[2])
        return arr

    def mass(self,int atnum):
        return self.thisptr.Mass(atnum)

    def box_crd(self):
        cdef Box box = Box()
        box.thisptr[0] = self.thisptr.BoxCrd()
        return box

    def x_address(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def v_address(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def b_address(self):
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

    def set_frame(self,int natomIn):
        return self.thisptr.SetupFrame(natomIn)

    #def set_frame_m(self, list atlist):
    #    cdef vector[_Atom] v 
    #    v = atomlist_to_vector(atlist)
    #    return self.thisptr.SetupFrameM(v)

    def set_frame_x_m(self, vector[double] Xin, vector[double] massIn):
        return self.thisptr.SetupFrameXM(Xin, massIn)

    def set_frame_v(self, Topology top, bint hasVelocity, int nDim):
        return self.thisptr.SetupFrameV(top.thisptr.Atoms(), hasVelocity, nDim)

    #def set_frame_from_mask(self, AtomMask atmask, list atlist):
    #    cdef vector[_Atom] v = atomlist_to_vector(atlist)
    #    return self.thisptr.SetupFrameFromMask(atmask.thisptr[0], v)

    def set_coordinates(self, Frame frame, *args):
        cdef AtomMask atmask 
        if not args:
            self.thisptr.SetCoordinates(frame.thisptr[0])
        else:
            atmask = args[0]
            self.thisptr.SetCoordinates(frame.thisptr[0], atmask.thisptr[0])

    def set_frame(self, Frame frame, AtomMask atmask):
        self.thisptr.SetFrame(frame.thisptr[0], atmask.thisptr[0])

    def set_coordinates_by_map(self, Frame frame, vector[int] mapIn):
        self.thisptr.SetCoordinatesByMap(frame.thisptr[0], mapIn)

    def zero_coords(self):
        self.thisptr.ZeroCoords()

    def __iadd__(Frame self, Frame other):
        # either of two methods are correct
        #self.thisptr[0] = self.thisptr[0].addequal(other.thisptr[0])
        self.thisptr[0] += other.thisptr[0]
        return self
    
    def __isub__(Frame self, Frame other):
        # either of two methods are correct
        #self.thisptr[0] = self.thisptr[0].subequal(other.thisptr[0])
        self.thisptr[0] -= other.thisptr[0]
        return self

    def __imul__(Frame self, Frame other):
        # either of two methods are correct
        #self.thisptr[0] = self.thisptr[0].mulequal(other.thisptr[0])
        self.thisptr[0] *= other.thisptr[0]
        return self

    def __mul__(Frame self, Frame other):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0] * other.thisptr[0]
        return frame

    def __sub__(Frame self, Frame other):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0] - other.thisptr[0]
        return frame

    def divide(self, double divisor, *args):
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

    def v_center_of_mass(self, AtomMask atmask):
        # return Vec3 instance
        cdef Vec3 v3 = Vec3()
        v3.thisptr[0] = self.thisptr.VCenterOfMass(atmask.thisptr[0])
        return v3

    def v_geometric_center(self, AtomMask atmask):
        # return Vec3 instance
        cdef Vec3 v3 = Vec3()
        v3.thisptr[0] = self.thisptr.VGeometricCenter(atmask.thisptr[0])
        return v3

    def translate(self, *args):
        cdef firstAtom, lastAtom
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

    # Not in cpptraj anymore
    #def center(self, AtomMask atm, CenterMode ctmode, Vec3 v, bint use_mass=False):
    #    self.thisptr.Center(atm.thisptr[0], ctmode, v.thisptr[0], use_mass)

    def center_on_origin(self,bint useMassIn):
        cdef Vec3 v = Vec3()
        v.thisptr[0] = self.thisptr.CenterOnOrigin(useMassIn)
        return v

    def rmsd(self,Frame frame, bint use_mass=False, *args):
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
        cdef Matrix_3x3 mat 
        cdef Vec3 v

        if not args:
            return self.thisptr.RMSD_CenteredRef(ref.thisptr[0], use_mass)
        else:
            mat, v = args
            return self.thisptr.RMSD_CenteredRef(ref.thisptr[0], mat.thisptr[0], v.thisptr[0], use_mass)

    def rmsd_no_fit(self, Frame frame, useMassIn):
        return self.thisptr.RMSD_NoFit(frame.thisptr[0], useMassIn)

    # deprecated?
    #def rmsd_fit_to_ref(self, Frame frame, Vec3 vec):
    #    return self.thisptr.RMSD_FitToRef(frame.thisptr[0], vec.thisptr[0])

    def dist_rmsd(self, Frame frame):
        return self.thisptr.DISTRMSD(frame.thisptr[0])

    def set_axis_of_rotation(self, int atom1, int atom2):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.SetAxisOfRotation(atom1, atom2)
        return vec

    def calculate_inertia(self, AtomMask atm, Matrix_3x3 Inertia):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.CalculateInertia(atm.thisptr[0], Inertia.thisptr[0])
        return vec

    def calc_temperature(self, AtomMask mask, int deg_of_freedom):
        return self.thisptr.CalcTemperature(mask.thisptr[0], deg_of_freedom)
