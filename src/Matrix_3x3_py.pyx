# distutils: language = c++

from Vec3_py cimport *
from Vec3_py import Vec3
from Matrix_3x3 cimport *

cdef class Matrix_3x3:
    cdef:
        _Matrix_3x3 * thisptr
        int MAX_ITERATIONS

    def __cinit__(self):
        self.MAX_ITERATIONS = 50
        #not done (and correct ye)
        self.thisptr = new _Matrix_3x3()

    def __dealloc__(self):
        del self.thisptr

    def Zero(self):
        self.thisptr.Zero()

    def Print(self, char* Title):
        """Print matrix"""
        self.thisptr.Print(Title)

    cdef Diagonalize(self, _Vec3 VecD):
        
        self.thisptr.Diagonalize(VecD)
    
    cdef Diagonalize_Sort(self, _Vec3 VecDS):
        
        self.thisptr.Diagonalize_Sort(VecDS)

    def Transpose(self):
        self.thisptr.Transpose()
