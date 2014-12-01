# distutils: language = c++
# TODO: 
#     + figure out why I can not delcare "ctypedef vector[float] CRDtype"
#       inside cppclass
#     + add more methods
# 
from cython.operator cimport dereference as deref
from libcpp.vector cimport vector
from AtomMask cimport *
from AtomMask import AtomMask
from Frame cimport CRDtype
from Vec3 cimport Vec3

# this method does not work. Don't know how to use template
#cdef vector[U] convert_list_to_vector(mylist):
#    cdef T obj
#    cdef vector[U] vt
#
#    for obj in mylist:
#        vt.push_back(obj.thisptr[0])
#    return vt

def check_instance(inst, clsname):
    if not isinstance(inst, clsname):
        raise ValueError("Must be instance of %s") % clsname.__name__

cdef class Frame:
    def __cinit__(self, int natom=0, *args):
        cdef Frame frame
        cdef AtomMask atmask
        cdef vector[_Atom] vt
        if not args:
            self.thisptr = new _Frame(natom)
        else:
            if len(args) == 2:
                frame, atmask = args
                self.thisptr = new _Frame(frame, atmask)
            elif len(args) == 1:
                if isinstance(args[0], Frame):
                    frame = args[0]
                    self.thisptr = new _Frame(frame)
                else:
                    atlist = args[0]
                    vt = convert_list_to_vector(atlis)
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
        cdef float tmp

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

    #def double operator[](self,int idx):
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

    #def  double * CRD(self,int idx):

    #def VXYZ(self,int atnum):
    #    """TODO: not done yet"""
    #    cdef double[:] darray
    #    cdef double* dptr
    #    dptr = self.thisptr.VXYZ(atnum)
    #    pass

    def Mass(self,int atnum):
        return self.thisptr.Mass(atnum)

    #def  Box BoxCrd(self):

    #def  double * xAddress(self):

    #def  double * vAddress(self):

    #def  double * bAddress(self):

    #def  double * tAddress(self):

    #def  int * iAddress(self):

    #def  double * xAddress(self):

    #def  double * vAddress(self):

    #def  double * bAddress(self):

    #def  double * tAddress(self):

    #def  int * iAddress(self):

    #def  void SetBoxAngles(self, double *):

    #def int SetupFrame(self,int):

    #def int SetupFrameM(self, vector[Atom]):

    #def int SetupFrameXM(self, vector[double], vector[double]):

    #def int SetupFrameV(self, vector[Atom], bint, int):

    #def int SetupFrameFromMask(self, AtomMask, vector[Atom]):

    #def void SetCoordinates(self, Frame, AtomMask):

    #def void SetCoordinates(self, Frame):

    #def void SetFrame(self, Frame, AtomMask):

    #def void SetCoordinatesByMap(self, Frame, vector[int]):

    #def void SetReferenceByMap(self, Frame, vector[int]):

    #def void SetTargetByMap(self, Frame, vector[int]):

    #def void ZeroCoords(self):

    #def Frame operator+=(self, Frame):

    #def Frame operator-=(self, Frame):

    #def Frame operator*=(self, Frame):

    #def  Frame operator*(self, Frame):

    #def  Frame operator-(self, Frame):

    #def int Divide(self, Frame, double):

    #def void Divide(self,double):

    #def void AddByMask(self, Frame, AtomMask):

    #def  bint CheckCoordsInvalid(self):

    #def  Vec3 VCenterOfMass(self, AtomMask):

    #def  Vec3 VGeometricCenter(self, AtomMask):

    #def  Vec3 VCenterOfMass(self,int, int):

    #def  Vec3 VGeometricCenter(self,int, int):

    #def  void Translate(self, Vec3, int, int):
    #def  void Translate(self, Vec3, int):
    #def  void Translate(self, Vec3):

    def Translate(self, *args):
        cdef int firstAtom, lastAtom
        cdef Vec3 vec3
        if len(args) == 3:
            vec3, firstAtom, lastAtom= args
            check_instance(vec3, Vec3)
            vec3, firstAtom, lastAtom= args
            self.thisptr.Translate(vec3.thisptr[0], firstAtom, lastAtom)
        if len(args) == 2:
            vec3, atom = args
            check_instance(vec3, Vec3)
            self.thisptr.Translate(vec3.thisptr[0], atom)

    #def  void NegTranslate(self, Vec3):

    #def  void Rotate(self, Matrix_3x3):

    #def  void Rotate(self, Matrix_3x3, AtomMask):

    #def  void Trans_Rot_Trans(self, Vec3, Matrix_3x3, Vec3):

    #def void Scale(self, AtomMask, double, double, double):

    #def void Center(self, AtomMask, CenterMode, Vec3, bint):

    #def Vec3 CenterOnOrigin(self,bint):

    #def double RMSD(self,Frame, bint):

    #def double RMSD(self,Frame, Matrix_3x3, Vec3, Vec3, bint):

    #def double RMSD_CenteredRef(self, Frame, bint):

    #def double RMSD_CenteredRef(self, Frame, Matrix_3x3, Vec3, bint):

    #def double RMSD_NoFit(self, Frame, bint):

    #def double DISTRMSD(self, Frame):

    #def Vec3 SetAxisOfRotation(self,int, int):

    #def Vec3 CalculateInertia(self, AtomMask, Matrix_3x3):

    #def double CalcTemperature(self, AtomMask, int):

