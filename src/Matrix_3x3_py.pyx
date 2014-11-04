# distutils: language = c++
#@Dan and Jason: This file shows how I will wrap cpptraj lib
#this code is not correct (yet), just try to make a workflow. :D
#

from Vec3_py cimport Vec3
from Matrix_3x3 cimport *
from Vec3_py import Vec3 

cdef class Matrix_3x3:
    cdef:
        _Matrix_3x3 * thisptr
        int MAX_ITERATIONS

    def __cinit__(self, X=None):
        """TODO: add numpy array"""
        self.MAX_ITERATIONS = 50
        if X is None: 
            self.thisptr = new _Matrix_3x3()
        #elif isinstance(X, (float, int)):
        #    if len(X) == 1:
        #        self.thisptr = new _Matrix_3x3(X)
        #    elif len(X) == 3:
        #        self.thisptr = new _Matrix_3x3(X[0], X[1], X[2])

    def __dealloc__(self):
        """Free memory"""
        del self.thisptr

    def Zero(self):
        self.thisptr.Zero()

    def Print(self, char* Title):
        """Print matrix"""
        self.thisptr.Print(Title)

    def Diagonalize(self, Vec3 vect): 
        self.thisptr.Diagonalize(vect.thisptr[0])
        
    cdef Diagonalize_Sort(self, Vec3 vectds):
        self.thisptr.Diagonalize_Sort(vectds.thisptr[0])

    cdef Diagonalize_Sort_Chirality(self, Vec3 vectds, int idx):
        self.thisptr.Diagonalize_Sort_Chirality(vectds.thisptr[0], idx)

    def Transpose(self):
        self.thisptr.Transpose()

    def RotationAroundZ(self, idx, idy):
        self.thisptr.RotationAroundZ(idx, idy)

    def RotationAroundY(self, idx, idz):
        self.thisptr.RotationAroundY(idx, idz)

    def CalcRotationMatrix(self, Vec3 vec, double theta):
        self.thisptr.CalcRotationMatrix(vec.thisptr[0], id)

    def  __mul__(self, mymat):
        if isinstance(mymat, Matrix_3x3):
            pass

    #def __richcmp__(self, Matrix_3x3 mata, Matrix_3x3 matb):
    #    pass
        #if mata is None or matab is None:
        #    return NotImplemnted

        #return mata.thisptr == matb.thisptr
