# distutils: language = c++

from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from libcpp.vector cimport vector
"""
In [1]: from Matrix_3x3 import Matrix_3x3 as M3x3

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

#import numpy as np
#cimport numpy as np
from Vec3 cimport Vec3

#check memory leaked

cdef class Matrix_3x3:
    def __cinit__(self, double[::1] X=None):
        """TODO: 
             add doc
             Add: mat1 = Matrix_3x3(mat2)
                  (Cython complains "TypeError: 'src.Matrix_3x3.Matrix_3x3' 
                   does not have the buffer interface")
        """
        if X is None:
            #make new instance
            # make a Matrix_3x3 with 0.0 element
            self.thisptr = new _Matrix_3x3(0.0)
        else:
            if X.shape[0] == 9:
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
    
    def __str__(self):
        # TODO: write to matrix style rather than a list
        return ", ".join(str(x) for x in self.to_list())

    @classmethod
    def copy_mat(cls, Matrix_3x3 other):
        # create new instance of Matrix_3x3; make copy and return this instance
        newmat = Matrix_3x3()
        newmat.copy(other)
        return newmat

    def copy(self, Matrix_3x3 other):
        # deallocate previous pointer
        del self.thisptr
        self.thisptr = new _Matrix_3x3(other.thisptr[0])

    def __dealloc__(self):
        """Free memory"""
        if self.thisptr:
            del self.thisptr
        #print "I was deallocated"

    def __imul__(self, Matrix_3x3 other):
        """mat *= other"""
        self.thisptr[0].star_equal(other.thisptr[0])
        return self

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

    def __mul__(Matrix_3x3 self, other):
        #cdef Matrix_3x3 result = Matrix_3x3()
        #result.thisptr[0] = self.thisptr[0] * other.thisptr[0]
        #return result
        if isinstance(other, Vec3) or isinstance(other, Matrix_3x3):
            return self.mul(other)
        else:
            raise ValueError("Must be either Matrix_3x3")


    #def mul(Matrix_3x3 self, MatVecType other):
    #    """ 
    #    Note: for some reason this code does not work yet.
    #    (works fine with regular method "mult", but not with __mul__)
    #    Multiply two matrices or a matrix with a vector

    #    Parameters
    #    ----------
    #    self: Matrix_3x3 instance
    #    other: Matrix_3x3 instance or Vec3 instance

    #    Output
    #    ------
    #    new Matrix_3x3 instance or Vec3 instance
    #    """
    #    cdef MatVecType result
    #    if isinstance(other, Vec3):
    #        result = Vec3()
    #    elif isinstance(other, Matrix_3x3):
    #        result = Matrix_3x3()
    #    else:
    #        raise ValueError("Must be a Matrix_3x3 or a Vec3 instance")
    #    result.thisptr[0] = self.thisptr[0] * other.thisptr[0]
    #    return result

    def CalcRotationMatrix(self, *args):
        """
        """
        cdef Vec3 vec
        cdef double theta
        cdef double x, y, z

        if len(args)== 2:
            vec, theta = args
            if not isinstance(vec, Vec3):
                raise ValueError("Must be a vector")
            self.thisptr.CalcRotationMatrix(vec.thisptr[0], theta)
        elif len(args) == 3:
            x, y, z = args
            self.thisptr.CalcRotationMatrix(x, y, z)
        else:
            raise ValueError('must be "Vec3, theta" or "x, y, z"')

    def RotationAngle(self):
       return self.thisptr.RotationAngle()

    def AxisOfRotation(self, theta):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.AxisOfRotation(theta)
        return vec 

    def TransposeMult(self, Matrix_3x3 other):
        cdef Matrix_3x3 result
        result =  Matrix_3x3()
        result.thisptr[0] = self.thisptr.TransposeMult(other.thisptr[0])
        return result 

    def to_list(self):
        cdef double* ptr = self.thisptr.Dptr()
        cdef int i
        cdef vector[double] v
        for i in range(9):
            v.push_back(deref(ptr))
            incr(ptr)
        # Cython will convert vector to list
        return v

    def to_numpy_mat(self):
        """convert to numpy matrix"""
        try:
            import numpy as np
            mat = np.asarray(self.to_list(), dtype=np.float64).reshape((3,3))
            mat = np.matrix(mat)
            return mat
        except:
            raise ImportError("Must have numpy installed")
