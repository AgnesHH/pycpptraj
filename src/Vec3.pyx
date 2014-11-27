# distutils: language = c++
from array import array

cdef class Vec3:
    def __cinit__(self, double[:] X=None):
        self.thisptr = new _Vec3()
        self.SetVec(X)

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def Magnitude2(self):
        return self.thisptr.Magnitude2()

    def Zero(self):
        self.thisptr.Zero()

    #def SetVec(self, double x, double y, double z):
    #    self.thisptr.SetVec(x, y, z)

    def SetVec(self, double[:] X):
        """SetVec from an array"""
        if len(X) != 3:
            raise ValueError("must a an array of 3 elements")
        cdef double x, y, z 
        x = X[0]
        y = X[1]
        z = X[2]
        self.thisptr.SetVec(x, y, z)

    def Normalize(self):
        return self.thisptr.Normalize()

    def Print(self, mystring):
        self.thisptr.Print(mystring)

    def Angle(self, Vec3 othervec):
        return self.thisptr.Angle(othervec.thisptr[0])
