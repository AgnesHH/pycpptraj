# distutils: language = c++
#@Dan and Jason: This files shows how I will wrap cpptraj lib
#this code is not correct (yet), just try to make a workflow. :D
#
from Vec3 cimport *
from Vec3_py cimport Vec333 
from Matrix_3x3 cimport *

cdef class Matrix_3x3:
    cdef:
        _Matrix_3x3 * thisptr
        int MAX_ITERATIONS

    def __cinit__(self, X=None):
        """TODO: add numpy array"""
        self.MAX_ITERATIONS = 50
        if X is None: 
            self.thisptr = new _Matrix_3x3()
        elif isinstance(X, (double, int)):
            if len(X) == 1:
                self.thisptr = new _Matrix_3x3(X)
            elif len(X) == 3:
                self.thisptr = new _Matrix_3x3(X[0], X[1], X[2])

    def __dealloc__(self):
        """Free memory"""
        del self.thisptr

    def Zero(self):
        self.thisptr.Zero()

    def Print(self, char* Title):
        """Print matrix"""
        self.thisptr.Print(Title)

    cdef Diagonalize(self, _Vec3 VecD):
       """Add DOC here""" 
        self.thisptr.Diagonalize(VecD)

    def Diagonalize(self, VecD):
        if isinstance(VecD, Vec3):
            self.thisptr.Diagonalize(Vec3.thisptr)
        
    cdef Diagonalize_Sort(self, _Vec3 VecDS):
        
        self.thisptr.Diagonalize_Sort(VecDS)

    cdef Diagonalize_Sort_Chirality(self, _Vec3 VecD, idx):
        pass

    def Transpose(self):
        self.thisptr.Transpose()

    def RotationAroundZ(self, idx, idy):
        self.thisptr.RotationAroundZ(idx, idy)

    def RotationAroundY(self, idx, idz):
        self.thisptr.RotationAroundY(idx, idz)

    def CalcRotationMatrix(self, *args):
        if len(args) == 2:
            VecD,id = arg
            if isinstance(VecD, _Vec3) and isinstance(id, (int, double)):
                self.thisptr.CalcRotationMatrix(VecD, id)
        elif len(args) == 3:
            x, y, z = args
            if (isinstance(x, (int, double)) and isinstance(y,(int, double)) 
                                            and isinstance(z, (int, double))):
                #convert to double [to be added later]
                self.thisptr.CalcRotationMatrix(x, y, z)

    def  __mul__(self, mymat):
        if isinstance(mymat, Matrix_3x3):
            pass

    def __richcmp__(self, Matrix_3x3 mata, Matrix_3x3 matb):
        pass
        #if mata is None or matab is None:
        #    return NotImplemnted

        #return mata.thisptr == matb.thisptr
