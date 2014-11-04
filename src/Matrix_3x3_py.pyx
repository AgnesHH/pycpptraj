# distutils: language = c++
#@Dan and Jason: This file shows how I will wrap cpptraj lib
#this code is not correct (yet), just try to make a workflow. :D

"""
In [1]: from Matrix_3x3_py import Matrix_3x3 as M3x3

In [2]: import numpy as np

In [3]: 

In [3]: x = np.arange(9).astype(float)

In [4]: m = M3x3(x)

In [5]: m.Print("3x3 matrix m: ")
    3x3 matrix m: 
       0.0000   1.0000   2.0000
       3.0000   4.0000   5.0000
       6.0000   7.0000   8.0000

In [6]: 

In [6]: y = np.array([100.,]).astype(float)

In [7]: n = M3x3(y)

In [8]: n.Print("3x3 matrix n: ")
    3x3 matrix n: 
     100.0000 100.0000 100.0000
     100.0000 100.0000 100.0000
     100.0000 100.0000 100.0000
"""

from copy import deepcopy
#import numpy as np
#cimport numpy as np
from Vec3_py cimport Vec3
from Matrix_3x3 cimport *
from Vec3_py import Vec3 

cdef class Matrix_3x3:
    cdef:
        _Matrix_3x3 * thisptr
        int MAX_ITERATIONS

    def __cinit__(self, double[::1] X=None):
        """TODO: add numpy array"""
        self.MAX_ITERATIONS = 50
        if X is None: 
            #make new instance
            self.thisptr = new _Matrix_3x3()
        #copy constructor, not sure how to do this shortly
        elif isinstance(X, Matrix_3x3):
            self = deepcopy(X)
        elif X.shape[0] == 9:
            #Takes array of 9, row-major
            self.thisptr = new _Matrix_3x3(&X[0])
        elif X.shape[0] == 1:
            #Set all elements to the same number
            self.thisptr = new _Matrix_3x3(X[0])

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
        
    def Diagonalize_Sort(self, Vec3 vectds):
        self.thisptr.Diagonalize_Sort(vectds.thisptr[0])

    def Diagonalize_Sort_Chirality(self, Vec3 vectds, int idx):
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
