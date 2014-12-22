# distutils: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr


cdef class Box:
    def __cinit__(self, *args):
        cdef double[:] boxIn 
        cdef Box rhs
        if not args:
            self.thisptr = new _Box()
        elif len(args) == 1:
            if isinstance(args[0], Box):
                rhs = args[0]
                self.thisptr = new _Box(rhs.thisptr[0])
            else:
                boxIn = args[0]
                self.thisptr = new _Box(&boxIn[0])
        else: 
            raise ValueError("")

    def __dealloc__(self):
        del self.thisptr

    def __getitem__(self, idx):
        return self.thisptr.index_opr(idx)

    def __iter__(self):
        for i in range(6):
            yield self[i]

    @property
    def TypeName(self):
        return self.thisptr.TypeName()
    
    def SetBetaLengths(self, double beta, double xin, double yin, double zin):
        self.thisptr.SetBetaLengths(beta, xin, yin, zin)

    def SetBox(self, double[:] boxIn):
        self.thisptr.SetBox(&boxIn[0])

    def SetTruncOct(self):
        self.thisptr.SetTruncOct()

    def SetNoBox(self):
        self.thisptr.SetNoBox()

    def SetMissingInfo(self, Box boxinst):
        self.thisptr.SetMissingInfo(boxinst.thisptr[0])

    def ToRecip(self,Matrix_3x3 ucell, Matrix_3x3 recip):
        return self.thisptr.ToRecip(ucell.thisptr[0], recip.thisptr[0])

    @property
    def Type(self):
        return self.thisptr.Type()

    property BoxX:
        def __get__(self):
            return self.thisptr.BoxX()
        def __set__(self, double value):
            self.thisptr.SetX(value)

    property BoxY:
        def __get__(self):
            return self.thisptr.BoxY()
        def __set__(self, double value):
            self.thisptr.SetY(value)

    property BoxZ:
        def __get__(self):
            return self.thisptr.BoxZ()
        def __set__(self, double value):
            self.thisptr.SetZ(value)

    property Alpha:
        def __get__(self):
            return self.thisptr.Alpha()
        def __set__(self, double value):
            self.thisptr.SetAlpha(value)

    property Beta:
        def __get__(self):
            return self.thisptr.Beta()
        def __set__(self, double value):
            self.thisptr.SetBeta(value)

    property Gamma:
        def __get__(self):
            return self.thisptr.Gamma()
        def __set__(self, double value):
            self.thisptr.SetGamma(value)

    def HasBox(self):
        return self.thisptr.HasBox()

    @property
    def Center(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Center()
        return vec

    @property
    def Lengths(self):
        cdef Vec3 vec = Vec3()
        vec.thisptr[0] = self.thisptr.Lengths()
        return vec

    @property
    def boxarr(self):
        cdef int i
        cdef vector[double] v
        cdef double* ptr = self.thisptr.boxPtr()

        for i in range(6):
            v.push_back(deref(ptr+i))
        return v

