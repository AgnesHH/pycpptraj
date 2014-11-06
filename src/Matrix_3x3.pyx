# distutils: language = c++

"""
In [1]: from Matrix_3x3_py import Matrix_3x3 as M3x3

In [2]: import numpy as np


In [3]: x = np.arange(9).astype(float)

In [4]: m = M3x3(x)

In [5]: m.Print("3x3 matrix m: ")
    3x3 matrix m: 
       0.0000   1.0000   2.0000
       3.0000   4.0000   5.0000
       6.0000   7.0000   8.0000

In [6]: y = np.array([100.,]).astype(float)

In [7]: n = M3x3(y)

In [8]: n.Print("3x3 matrix n: ")
    3x3 matrix n: 
     100.0000 100.0000 100.0000
     100.0000 100.0000 100.0000
     100.0000 100.0000 100.0000
"""
from copy import deepcopy
from Vec3 import Vec3
from Vec3 cimport Vec3

cdef class Matrix_3x3:
    def __cinit__(self, double[::1] X=None):
        """TODO: add doc"""
        if X is None: 
            #make new instance
            self.thisptr = new _Matrix_3x3()
        elif X.shape[0] == 9:
            #Takes array of 9, row-major
            self.thisptr = new _Matrix_3x3(&X[0])
        elif X.shape[0] == 1:
            #Set all elements to the same number
            self.thisptr = new _Matrix_3x3(X[0])
        elif X.shape[0] == 3:
            #Set Set diagonal
            x, y, z = X
            self.thisptr = new _Matrix_3x3(x, y, z)
        else: 
            raise ValueError("Must be array with length of None, 1, 3 or 9")

    def __dealloc__(self):
        """Free memory"""
        del self.thisptr
        #print "I was deallocated"

    def copy(self, Matrix_3x3 other):
        """
        Copy matrix

        Parameters:
        ----------
        other : Matrix_3x3 instance

        Returns:
        -------
        out : Matrix_3x3 instance

        Examples
        -------
        #add example here
        >>>x = np.arange(9).astype(float)
        >>>m = M3x3(x)
        >>>mcp = M3x3()
        >>>mcp.copy(m)
        >>>m.Print("m")
        >>>print
        >>>mcp.Print("mcp")
        """
        self.thisptr = other.thisptr
        
    def Row1(self):
        """
        Parameters: None
        ---------------

        Return
        ------
        Instance of Vec3
        """
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Row1()
        return vec

    def Row2(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Row2()
        return vec

    def Row3(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Row3()
        return vec

    def Col1(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Col1()
        return vec

    def Col2(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Col2()
        return vec

    def Col3(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Col3()
        return vec

    def Zero(self):
        self.thisptr.Zero()

    def Print(self, char* Title=""):
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

    def CalcRotationMatrix(Matrix_3x3 self, Vec3 vec, double theta):
        self.thisptr.CalcRotationMatrix(vec.thisptr[0], id)

    def  __mul__(Matrix_3x3 self, Matrix_3x3 other):
        """
        Multiply two matrix

        Parameters
        ----------
        self: Matrix_3x3 instance
        other: Matrix_3x3 instance

        Output
        ------
        new Matrix_3x3 instance
        """
        cdef Matrix_3x3 result = Matrix_3x3()
        result.thisptr[0] = self.thisptr[0] * other.thisptr[0]
        return result

