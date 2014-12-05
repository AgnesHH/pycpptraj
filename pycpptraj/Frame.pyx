# distutils: language = c++
# TODO: 
#     + figure out why I can not delcare "ctypedef vector[float] CRDtype" inside cppclass
#     + add more methods
# 
from cython.operator cimport dereference as deref
from libcpp.vector cimport vector
from AtomMask cimport *
from AtomMask import AtomMask
from Frame cimport CRDtype
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
        #self.thisptr = new _Frame()
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

    def SetFromCRD(self, CRDtype farray, *args):
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

    def ConvertToCRD(self, int numBoxCrd, bint hasVel):
        return self.thisptr.ConvertToCRD(numBoxCrd, hasVel)
        
    def printAtomCoord(self, int atom):
        self.thisptr.printAtomCoord(atom)

    def Info(self, char* msg):
        self.thisptr.Info(msg)

    def ClearAtoms(self):
        self.thisptr.ClearAtoms()

    def AddXYZ(self, double[:] xyz):
        self.thisptr.AddXYZ(&xyz[0])

    def AddVec3(self, Vec3 vec):
        self.thisptr.AddVec3(vec.thisptr[0])

    def SwapAtoms(self, int atom1, int atom2):
        self.thisptr.SwapAtoms(atom1, atom2)

    def __getitem__(self, idx):
        return self.thisptr.index_opr(idx)

    def empty(self):
        return self.thisptr.empty()

    def HasVelocity(self):
        return self.thisptr.HasVelocity()

    @property
    def Natom(self):
       return self.thisptr.Natom()

    property size:
        def __get__(self):
            return self.thisptr.size()

    property NrepDims:
        def __get__(self):
            return self.thisptr.NrepDims()

    property Temperature:
        def __get__(self):
            return self.thisptr.Temperature()

    #def  double * XYZ(self,int atnum):
    # Correct yet?
    def XYZ(self, int atnum):
        # cpptraj: return double*
        raise NotImplementedError()
        # TODO: throw data or memory view from pointer
        #cdef double[:] xyz = self.thisptr.XYZ(atnum)
        #return xyz

    def CRD(self,int idx):
        # cpptraj: return double*
        raise NotImplementedError()

    def VXYZ(self,int atnum):
        raise NotImplementedError()
        # cpptraj: return double*
    #    """TODO: not done yet"""
    #    cdef[:] darray
    #    cdef* dptr
    #    dptr = self.thisptr.VXYZ(atnum)
    #    pass

    def Mass(self,int atnum):
        return self.thisptr.Mass(atnum)

    #def BoxCrd(self):
    #    cdef Box box = Box()
    #    box.thisptr[0] = self.thisptr.BoxCrd()
    #    return box

    def xAddress(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def vAddress(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def bAddress(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def tAddress(self):
        # cpptraj: return double*
        raise NotImplementedError()

    def iAddress(self):
        # cpptraj: return int*
        raise NotImplementedError()

    def SetBoxAngles(self, double[:] ain):
        self.thisptr.SetBoxAngles(&ain[0])

    def SetupFrame(self,int natomIn):
        return self.thisptr.SetupFrame(natomIn)

    def SetupFrameM(self, list atlist):
        cdef vector[_Atom] v 
        v = atomlist_to_vector(atlist)
        return self.thisptr.SetupFrameM(v)

    def SetupFrameXM(self, vector[double] Xin, vector[double] massIn):
        return self.thisptr.SetupFrameXM(Xin, massIn)

    def SetupFrameV(self, atlist, bint hasVelocity, int nDim):
        cdef vector[_Atom] v = atomlist_to_vector(atlist)
        return self.thisptr.SetupFrameV(v, hasVelocity, nDim)

    def SetupFrameFromMask(self, AtomMask atmask, list atlist):
        cdef vector[_Atom] v = atomlist_to_vector(atlist)
        return self.thisptr.SetupFrameFromMask(atmask.thisptr[0], v)

    def SetCoordinates(self, Frame frame, *args):
        cdef AtomMask atmask 
        if not args:
            self.thisptr.SetCoordinates(frame.thisptr[0])
        else:
            atmask = args[0]
            self.thisptr.SetCoordinates(frame.thisptr[0], atmask.thisptr[0])
    def SetFrame(self, Frame frame, AtomMask atmask):
        self.thisptr.SetFrame(frame.thisptr[0], atmask.thisptr[0])

    def SetCoordinatesByMap(self, Frame frame, vector[int] mapIn):
        self.thisptr.SetCoordinatesByMap(frame.thisptr[0], mapIn)

    # not in Frame.pxd
    #def SetReferenceByMap(self, Frame frame, vector[int] mapIn):
    #    self.thisptr.SetReferenceByMap(frame.thisptr[0], mapIn)

    # not in Frame.pxd
    #def SetTargetByMap(self, Frame frame, vector[int] mapIn):
    #    self.thisptr.SetTargetByMap(frame.thisptr[0], mapIn)

    def ZeroCoords(self):
        self.thisptr.ZeroCoords()

    #def Frame operator+=(self, Frame):

    #def Frame operator-=(self, Frame):

    #def Frame operator*=(self, Frame):

    #def  Frame operator*(self, Frame):
    def __mul__(Frame self, Frame other):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0] * other.thisptr[0]
        return frame

    #def  Frame operator-(self, Frame):
    def __sub__(Frame self, Frame other):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr[0] - other.thisptr[0]
        return frame

    #def Divide(self, Frame, double):
    def Divide(self, double divisor, *args):
        cdef Frame frame
        if not args:
            self.thisptr.Divide(divisor)
        else:
            frame = args[0]
            return self.thisptr.Divide(frame.thisptr[0], divisor)

    def AddByMask(self, Frame frame, AtomMask atmask):
        self.thisptr.AddByMask(frame.thisptr[0], atmask.thisptr[0])

    def CheckCoordsInvalid(self):
        return self.thisptr.CheckCoordsInvalid()

    def VCenterOfMass(self, AtomMask atmask):
        # return Vec3 instance
        cdef Vec3 v3 = Vec3()
        v3.thisptr[0] = self.thisptr.VCenterOfMass(atmask.thisptr[0])
        return v3

    def  VGeometricCenter(self, AtomMask atmask):
        # return Vec3 instance
        cdef Vec3 v3 = Vec3()
        v3.thisptr[0] = self.thisptr.VGeometricCenter(atmask.thisptr[0])
        return v3

    #def  Vec3 VCenterOfMass(self,int, int):

    #def  Vec3 VGeometricCenter(self,int, int):

    def Translate(self, *args):
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

    def NegTranslate(self, Vec3 vec):
        self.thisptr.NegTranslate(vec.thisptr[0])

    def Rotate(self, Matrix_3x3 m3, *args):
        cdef AtomMask atmask
        if not args:
            self.thisptr.Rotate(m3.thisptr[0])
        elif len(args) == 1:
            atmask = args[0]
            self.thisptr.Rotate(m3.thisptr[0], atmask.thisptr[0])

    def  Trans_Rot_Trans(self, Vec3 vec3, Matrix_3x3 m3, Vec3 vec3_2):
        self.thisptr.Trans_Rot_Trans(vec3.thisptr[0], m3.thisptr[0], vec3_2.thisptr[0])

    #def Scale(self, AtomMask, double, double, double):

    #def Center(self, AtomMask, CenterMode, Vec3, bint):

    def CenterOnOrigin(self,bint useMassIn):
        cdef Vec3 v = Vec3()
        v.thisptr[0] = self.thisptr.CenterOnOrigin(useMassIn)
        return v

    def RMSD(self,Frame frame, bint use_mass=False, *args):
        cdef Matrix_3x3 m3
        cdef Vec3 v1, v2

        if not args:
            return self.thisptr.RMSD(frame.thisptr[0], use_mass)
        elif len(args) == 3:
            m3, v1, v2 = args
            return self.thisptr.RMSD(frame.thisptr[0], m3.thisptr[0], v1.thisptr[0], v2.thisptr[0], use_mass)
        else:
            raise NotImplementedError()


    #def RMSD_CenteredRef(self, Frame, bint):

    #def RMSD_CenteredRef(self, Frame, Matrix_3x3, Vec3, bint):

    def RMSD_NoFit(self, Frame frame, useMassIn):
        return self.thisptr.RMSD_NoFit(frame.thisptr[0], useMassIn)

    def DISTRMSD(self, Frame frame):
        return self.thisptr.DISTRMSD(frame.thisptr[0])

    #def SetAxisOfRotation(self,int, int):

    #def CalculateInertia(self, AtomMask, Matrix_3x3):

    def CalcTemperature(self, AtomMask mask, int deg_of_freedom):
        return self.thisptr.CalcTemperature(mask.thisptr[0], deg_of_freedom)

