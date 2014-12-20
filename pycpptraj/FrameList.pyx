# distutils: language = c++


cdef class FrameList:
    def __cinit__(self, py_free_mem=True):
        self.thisptr = new _FrameList()
        self.py_free_mem = py_free_mem

    def __dealloc__(self):
        if self.py_free_mem:
            del self.thisptr

    def clear(self):
        self.thisptr.Clear()

    def set_debug(self, int idx):
        self.thisptr.SetDebug(idx)

    def active_reference(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.ActiveReference()
        return frame

    def set_active_ref(self, int numIn):
        return self.thisptr.SetActiveRef(numIn)

    def add_ref_frame(self,ArgList arglist, TopologyList toplist):
        return self.thisptr.AddRefFrame(arglist.thisptr[0], toplist.thisptr[0])

    def get_frame_from_args(self,ArgList arglist):
        cdef ReferenceFrame ref = ReferenceFrame()
        ref.thisptr[0] = self.thisptr.GetFrameFromArgs(arglist.thisptr[0])
        return ref

    def get_frame_by_name(self, string name):
        cdef ReferenceFrame ref = ReferenceFrame()
        ref.thisptr[0] = self.thisptr.GetFrameByName(name)
        return ref

    def list(self):
        self.thisptr.List()

    def n_frames(self):
        return self.thisptr.NumFrames()
