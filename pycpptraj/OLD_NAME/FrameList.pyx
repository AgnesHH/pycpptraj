# distutils: language = c++


cdef class FrameList:
    def __cinit__(self):
        self.thisptr = new _FrameList()

    def __dealloc__(self):
        del self.thisptr

    def Clear(self):
        self.thisptr.Clear()

    def SetDebug(self, int idx):
        self.thisptr.SetDebug(idx)

    def ActiveReference(self):
        cdef Frame frame = Frame()
        frame.thisptr[0] = self.thisptr.ActiveReference()
        return frame

    def SetActiveRef(self, int numIn):
        return self.thisptr.SetActiveRef(numIn)

    def AddRefFrame(self,ArgList arglist, TopologyList toplist):
        return self.thisptr.AddRefFrame(arglist.thisptr[0], toplist.thisptr[0])

    def ReferenceFrame GetFrameFromArgs(self,ArgList arglist):
        cdef ReferenceFrame ref = ReferenceFrame()
        ref.thisptr[0] = self.thisptr.GetFrameFromArgs(arglist.thisptr[0])
        return ref

    def ReferenceFrame GetFrameByName(self, string name):
        cdef ReferenceFrame ref = ReferenceFrame()
        ref.thisptr[0] = self.thisptr.GetFrameByName(name)

    def List(self):
        self.thisptr.List()

    def NumFrames(self):
        return self.thisptr.NumFrames()

