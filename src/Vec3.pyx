# distutils: language = c++

cdef class Vec3:
    #cdef _Vec3* thisptr
    #(cdef from Vec3_py.pxd, dont need to re-cdef)

    def __cinit__(self):
        self.thisptr = new _Vec3()

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def Magnitude2(self):
        return self.thisptr.Magnitude2()

    def Zero(self):
        self.thisptr.Zero()

    def SetVec(self, double x, double y, double z):
        self.thisptr.SetVec(x, y, z)

    def SetVec(self, X):
        """SetVec from an array"""
        if len(X) != 3:
            raise ValueError("must a an array of 3 elements")
        cdef double x, y, z = X
        self.thisptr.SetVec(x, y, z)

    def Normalize(self):
        return self.thisptr.Normalize()

    def Print(self, mystring):
        self.thisptr.Print(mystring)

    def Angle(self, Vec3 othervec):
        return self.thisptr.Angle(othervec.thisptr[0])

