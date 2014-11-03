# distutils: language = c++

from Vec3_py cimport *

cdef class Vec3:
    cdef _Vec3 *thisptr

    def __cinit__(self, x='', y='', z=''):
        self.thisptr = new _Vec3()
        if type(x) == 'double' and (not y) and (not z):
            self.thisptr.SetVec(x, x, x)
        if x and y and z:
            self.thisptr.SetVec(x, y, z)

    def __dealloc__(self):
        del self.thisptr

    def Magnitude2(self):
        return self.thisptr.Magnitude2()

    def Zero(self):
        self.thisptr.Zero()

    def SetVec(self, double x, double y, double z):
        self.thisptr.SetVec(x, y, z)

    def Normalize(self):
        return self.thisptr.Normalize()

    def Print(self, mystring):
        self.thisptr.Print(mystring)

    def Angle(self, Vec3 othervec):
        return self.thisptr.Angle(othervec.thisptr[0])
