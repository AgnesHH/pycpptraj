# distutils: language = c++

from cython.operator cimport dereference as deref
cimport numpy as np
try:
    import numpy as np
except:
    pass
from libcpp.vector cimport vector
from AtomMask cimport *
from AtomMask import AtomMask
from Frame cimport CRDtype
from Topology cimport Topology
from Vec3 cimport Vec3
from util cimport atomlist_to_vector

def check_instance(inst, clsname):
    if not isinstance(inst, clsname):
        raise ValueError("Must be instance of %s") % clsname.__name__

cdef class Frame:
    def __cinit__(self, *args):
        cdef Frame frame
        cdef AtomMask atmask
        cdef vector[_Atom] vt
        cdef Atom at
        cdef list atlist
        cdef int natom

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
        del self.thisptr

    def set_from_c_r_d(self, CRDtype farray, *args):
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

    def convert_to_c_r_d(self, int numBoxCrd, bint hasVel):
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
        """return: ?"""
        return self.thisptr.index_opr(idx)

    def empty(self):
        return self.thisptr.empty()

    def has_velocity(self):
        return self.thisptr.HasVelocity()

    @property
    def natom(self):
       return self.thisptr.Natom()

    property size:
        def __get__(self):
            return self.thisptr.size()

    property n_repdims:
        def __get__(self):
            return self.thisptr.NrepDims()

    property Temperature:
        def __get__(self):
            return self.thisptr.Temperature()

    #def  double * XYZ(self,int atnum):
    # Correct yet?
    def xyz(self):
        # cpptraj: return double*
        cdef int i
        cdef natom = self.natom
        #cdef double[:] _xyz
        cdef vector[double] v

        for i in range(natom):
            #_xyz[3 * i]     = self.thisptr.XYZ(i)[0]
            #_xyz[3 * i]     = self.thisptr.XYZ(i)[1]
            #_xyz[3 * i + 1] = self.thisptr.XYZ(i)[2]
            v.push_back(self.thisptr.XYZ(i)[0])
            v.push_back(self.thisptr.XYZ(i)[1])
            v.push_back(self.thisptr.XYZ(i)[2])
        #_xyz = v
        #return _xyz
        # TODO: return array instead of vector (Cython will convert vector to list)
        return v

    #def xyz(self):
    #    # STATUS: return wrong array
    #    try:
    #        import numpy as np
    #    except:
    #        raise ImportError("where is my numpy?")
    #    # numpy version
    #    # cpptraj: return double*
    #    cdef int i
    #    cdef natom = self.natom
    #    cdef double[:] _xyz = np.empty(3 * natom)

    #    for i in range(natom):
    #        _xyz[3 * i]     = self.thisptr.XYZ(i)[0]
    #        _xyz[3 * i]     = self.thisptr.XYZ(i)[1]
    #        _xyz[3 * i + 1] = self.thisptr.XYZ(i)[2]
    #    return _xyz[:natom]

    #def crd(self,int idx):
    #    cdef int i
    #    cdef natom = self.natom
    #    cdef double[:] _xyz

    #    for i in range(3 * natom):
    #        _xyz[i]     = self.thisptr.CRD(i)[0]
    #        _xyz[i + 1] = self.thisptr.CRD(i)[1]
    #        _xyz[i + 2] = self.thisptr.CRD(i)[2]
    #    return _xyz[:3*natom]

    #def v_xyz(self,int atnum):
    #    # cpptraj: return double*
    #    cdef int i
    #    cdef natom = self.natom
    #    cdef double[:] _xyz

    #    for i in range(natom):
    #        _xyz[3 * i    ] = self.thisptr.VXYZ(i)[0]
    #        _xyz[3 * i + 1] = self.thisptr.VXYZ(i)[1]
    #        _xyz[3 * i + 2] = self.thisptr.VXYZ(i)[2]
    #    return _xyz[:3*natom]

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
        # cpptraj: return double*
        raise NotImplementedError()

    def t_address(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def i_address(self):
        # cpptraj: return int*
        raise NotImplementedError()

    def set_box_angles(self, double[:] ain):
        self.thisptr.SetBoxAngles(&ain[0])

    def setup_frame(self,int natomIn):
        return self.thisptr.SetupFrame(natomIn)

    def setup_frame_m(self, list atlist):
        cdef vector[_Atom] v 
        v = atomlist_to_vector(atlist)
        return self.thisptr.SetupFrameM(v)

    def setup_frame_x_m(self, vector[double] Xin, vector[double] massIn):
        return self.thisptr.SetupFrameXM(Xin, massIn)

    def setup_frame_v(self, Topology top, bint hasVelocity, int nDim):
        return self.thisptr.SetupFrameV(top.thisptr.Atoms(), hasVelocity, nDim)

    def setup_frame_from_mask(self, AtomMask atmask, list atlist):
        cdef vector[_Atom] v = atomlist_to_vector(atlist)
        return self.thisptr.SetupFrameFromMask(atmask.thisptr[0], v)

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

    #def Frame operator+=(self, Frame):
    #def Frame operator-=(self, Frame):
    #def Frame operator*=(self, Frame):

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

    def center(self, AtomMask atm, CenterMode ctmode, Vec3 v, bint use_mass=False):
        self.thisptr.Center(atm.thisptr[0], ctmode, v.thisptr[0], use_mass)

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
