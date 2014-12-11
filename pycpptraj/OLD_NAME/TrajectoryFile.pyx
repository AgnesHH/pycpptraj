# distutils: language = c++


cdef class TrajectoryFile:
    def __cinit__(self):
        self.thisptr = new _TrajectoryFile()

    def __dealloc__(self):
        del self.thisptr

    def ReadOptions(self):
        self.thisptr.ReadOptions()

    def WriteOptions(self):
        self.thisptr.WriteOptions()

    def TrajFormatType GetFormatFromArg(self,ArgList a):
        return self.thispt.GetFormatFromArg(a)

    def TrajFormatType GetFormatFromString(self, string s):
        return self.thispt.GetFormatFromString(s)

    def GetExtensionForType(self,TrajFormatType t):
        return self.thispt.GetExtensionForType(t)

    def TrajFormatType GetTypeFromExtension(self, string e):
        return self.thispt.GetTypeFromExtension(e)

    def FormatString(self,TrajFormatType tt):
        return self.thispt.FormatString(tt)

    def SetDebug(self,int debug=0):
        self.thispt.SetDebug(debug)

    def SetTrajFileName(self, string, bint is_read=True):
        self.thispt.SetTrajFileName(fname, is_read)

    def SetTrajParm(self,Topology top):
        return self.thispt.SetTrajParm(top.thispt[0])

    def TrajParm(self):
        cdef Topology top = Topology()
        top.thispt[0] = self.thispt.TrajParm()[0]
        return top

    def TrajFilename(self):
        cdef FileName fname = FileName()
        fname.thispt[0] = self.thispt.TrajFilename()
        return fname
