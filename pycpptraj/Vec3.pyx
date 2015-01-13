# distutils: language = c++
from array import array
from libcpp.vector cimport vector
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr

# should we use numpy rather reinvent the wheel?
cdef class Vec3:
    def __cinit__(self, *args):
        cdef Vec3 vec
        cdef double x, y, z
        
        if not args:
            self.thisptr = new _Vec3()
        else:
            if len(args) == 1 and isinstance(args[0], Vec3):
                vec = args[0]
                self.thisptr = new _Vec3(vec.thisptr[0])
            else:
                self.thisptr = new _Vec3()
                if isinstance(args[0], (list, tuple)):
                    x, y, z = args[0]
                    self.SetVec(x, y, z)
                else:
                    self.SetVec(*args)

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    def __str__(self):
        cdef double x, y, z 
        x, y, z = self.to_list()
        return "Vec3 %s %s %s" %(str(x), str(y), str(z))

    def Magnitude2(self):
        return self.thisptr.Magnitude2()

    def Zero(self):
        self.thisptr.Zero()

    def SetVec(self, *args):
        """args = either array of 3 elements or x, y, z"""
        cdef double x, y, z
        cdef double[:] X

        if len(args) == 1:
            # array
            X = args[0]
            if len(X) != 3:
                raise ValueError("must a an array of 3 elements")
            else:
                x = X[0]
                y = X[1]
                z = X[2]
                self.thisptr.SetVec(x, y, z)
        elif len(args) == 3:
            # x, y, z
            x, y, z = args
            self.thisptr.SetVec(x, y, z)
        else:
            raise ValueError("must a an array or x, y, z format")

    def Normalize(self):
        return self.thisptr.Normalize()

    def Print(self, mystring):
        self.thisptr.Print(mystring)

    def Angle(self, Vec3 othervec):
        return self.thisptr.Angle(othervec.thisptr[0])

    def Assign(self, double[:] XYZ):
        self.thisptr.Assign(&XYZ[0])

    #def void operator /=(self,double xIn):
    def __idiv__(Vec3 self, double xIn):
        self.thisptr.divequal(xIn)
        return self

    #def Vec3 operator /(self,double xIn):
    def __div__(Vec3 self, double xIn):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr[0]/xIn
        return vec

    #def void operator *=(self,double xIn):
    # return "void": really?
    # Got: Segmentation fault (core dumped)
    def __imul__(Vec3 self, double xIn):
        self.thisptr.mulequal(xIn)
        return self

    def __mul__(Vec3 self, arg):
        cdef Vec3 rhs, vec
        cdef double xIn
        if isinstance(arg, Vec3):
            rhs = arg
            # return "double" 
            return self.thisptr[0] * rhs.thisptr[0]
        else:
            # assuming "arg" is either double or int
            xIn = <double> arg
            vec = Vec3()
            vec.thisptr[0] = self.thisptr[0] * xIn
            return vec

    def __add__(Vec3 self, arg):
        cdef double xIn
        cdef Vec3 rhs, vec
        vec = Vec3()

        if isinstance(arg, Vec3):
            rhs = arg
            vec.thisptr[0]= self.thisptr[0] + rhs.thisptr[0]
            return vec
        else:
            xIn = arg
            vec.thisptr[0] = self.thisptr[0] + xIn
        return vec

    def __iadd__(Vec3 self, arg):
        cdef double xIn
        cdef Vec3 rhs
        if isinstance(arg, Vec3):
            rhs = arg
            self.thisptr.addequal(rhs.thisptr[0])
        else:
            xIn = arg
            self.thisptr.addequal(xIn)
        return self

    def __sub__(Vec3 self, arg):
        cdef double xIn
        cdef Vec3 rhs, vec
        vec = Vec3()

        if isinstance(arg, Vec3):
            rhs = arg
            vec.thisptr[0]= self.thisptr[0] - rhs.thisptr[0]
            return vec
        else:
            xIn = arg
            vec = self + (-xIn)
        return vec

    def __isub__(Vec3 self, arg):
        cdef double xIn
        cdef Vec3 rhs
       
        if isinstance(arg, Vec3):
            rhs = arg
            self.thisptr.subequal(rhs.thisptr[0])
        else:
            xIn = arg
            self.thisptr.addequal(xIn)
        return self

    def Cross(self, Vec3 rhs):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Cross(rhs.thisptr[0])
        return vec

    def __getitem__(self, int idx):
        return self.thisptr.index_opr(idx)

    def IsZero(self):
        return self.thisptr.IsZero()

    def Neg(self):
        self.thisptr.Neg()

    def SignedAngle(self, Vec3 v1, Vec3 v2):
        return self.thisptr.SignedAngle(v1.thisptr[0], v2.thisptr[0])
 
    def to_list(self):
        cdef double* ptr = self.thisptr.Dptr()
        cdef int i
        cdef vector[double] v
        for i in range(3):
            v.push_back(deref(ptr))
            incr(ptr)
        return v
