# distutils: language = c++


cdef class ReferenceFrame:
    def __cinit__(self):
        self.thisptr = new _ReferenceFrame()

    def __dealloc__(self):
        del self.thisptr

    def coord(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.Coord()

    def parm(self):
        cdef Topology top = Topology()
        top.thisptr[0] = self.thisptr.Parm()
        return top

    #def bint error(self):

    def empty(self):
        return self.thisptr.empty()

    def frame_name(self):
        cdef FileName fn = FileName()
        fn.thisptr[0] = self.thisptr.FrameName()

    #def  string Tag(self):

    def load_ref(self, string fname, Topology parmIn, debug=0, *args):
        cdef ArgList argIn
        cdef string maskexpr
        if not args:
            return self.thisptr.LoadRef(fname, parmIn.thisptr, debug)
        elif len(args) == 2:
             argIn, maskexpr = args
             return self.thisptr.LoadRef(fname, argIn.thisptr[0], parmIn.thisptr,maskexpr, debug)

    def strip_ref(self, AtomMask atm):
        return self.thisptr.StripRef(atm.thisptr[0])

    def ref_info(self):
        self.thisptr.RefInfo()

    def clear_ref(self):
        self.thisptr.ClearRef()

