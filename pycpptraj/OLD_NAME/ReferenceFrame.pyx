# distutils: language = c++


cdef class ReferenceFrame:
    def __cinit__(self):
        self.thisptr = new _ReferenceFrame()

    def __dealloc__(self):
        del self.thisptr

    def Coord(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.Coord()

    def Parm(self):
        cdef Topology top = Topology()
        top.thisptr[0] = self.thisptr.Parm()

    #def bint error(self):

    def empty(self):
        return self.thisptr.empty()

    def FrameName(self):
        cdef FrameName fn = FileName()
        fn.thisptr[0] = self.thisptr.FrameName()

    #def  string Tag(self):

    def load_ref(self, string fname, Topology parmIn, debug=0, *agrs ):
        cdef ArgList argIn
        cdef string maskexpr
        if not args:
            return self.thisptr.LoadRef(fname, parmIn.thisptr, debug)
        elif len(args) == 2:
             argIn, maskexpr = args
             return self.thisptr.LoadRef(fname, argIn.thisptr[0], parmIn.thisptr,maskexpr, debug)

    def StripRef(self, AtomMask atm):
        return self.thisptr.StripRef(atm.thisptr[0])

    def RefInfo(self):
        self.thisptr.RefInfo()

    def ClearRef(self):
        self.thisptr.ClearRef()

