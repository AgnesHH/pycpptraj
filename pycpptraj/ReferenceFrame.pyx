# distutils: language = c++


cdef class ReferenceFrame:
    """
    Original cpptraj doc:
    ====================
        Hold single frame coordinates to be used as a reference.
        The frame and topology are stored as pointers instead of classes to
        save memory; this way multiple actions can use the same reference 
        structure without each having to have a different copy. Because
        of this, memory is not freed in ReferenceFrame destructor to avoid
        potential double-frees when ReferenceFrame is used in e.g. vectors.
        Freeing must be accomplished with the ClearRef function.
    """
    def __cinit__(self):
        self.thisptr = new _ReferenceFrame()

    def __dealloc__(self):
        del self.thisptr

    @property
    def frame(self):
        """return Frame instance"""
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.Coord()
        return frame

    @property
    def top(self):
        cdef Topology top = Topology()
        top.thisptr[0] = self.thisptr.Parm()
        return top

    def empty(self):
        return self.thisptr.empty()

    def frame_name(self):
        cdef FileName fn = FileName()
        fn.thisptr[0] = self.thisptr.FrameName()

    def load_ref(self, string fname, Topology parmIn, debug=0, *args):
        """Temp doc: load_ref(self, string fname, Topology parmIn, debug=0, *args)"""
        cdef ArgList argIn
        cdef string maskexpr
        if not args:
            return self.thisptr.LoadRef(fname, parmIn.thisptr, debug)
        elif len(args) == 2:
             argIn, maskexpr = args
             return self.thisptr.LoadRef(fname, argIn.thisptr[0], parmIn.thisptr,maskexpr, debug)

    def strip_ref(self, AtomMask atm):
        """temp doc: strip_ref(self, AtomMask atm)"""
        return self.thisptr.StripRef(atm.thisptr[0])

    def ref_info(self):
        self.thisptr.RefInfo()

    def clear_ref(self):
        "Free memory"
        self.thisptr.ClearRef()
