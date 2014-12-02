#:W distutils: language = c++


cdef class Parm_Amber:
    def __cinit__(self):
        self.thisptr = new _Parm_Amber()

    def __dealloc__(self):
        if self.thisptr != NULL:
            del self.thisptr

    def Alloc(self):
        cdef BaseIOtype baseio = BaseIOtype()
        #def BaseIOtype * Alloc(self):
        baseio.thisptr = self.thisptr.Alloc()
        return baseio

    def WriteHelp(self):
        self.thisptr.WriteHelp()

    def ID_ParmFormat(self, CpptrajFile fileIn):
        return self.thisptr.ID_ParmFormat(fileIn.thisptr[0])

    def processReadArgs(self,ArgList arglist):
        return self.thisptr.processReadArgs(arglist.thisptr[0])

    def ReadParm(self, string fname, Topology TopIn):
        return self.thisptr.ReadParm(fname, TopIn.thisptr[0])

    def processWriteArgs(self, ArgList argIn):
        self.thisptr.processWriteArgs(argIn.thisptr[0])

    def WriteParm(self, string fname, Topology parmIn):
        return self.thisptr.WriteParm(fname, parmIn.thisptr[0])

    def SetDebug(self,int debugIn):
        self.thisptr.SetDebug(debugIn)

