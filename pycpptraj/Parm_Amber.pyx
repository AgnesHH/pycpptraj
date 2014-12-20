#:W distutils: language = c++


cdef class Parm_Amber:
    def __cinit__(self):
        self.thisptr = new _Parm_Amber()

    def __dealloc__(self):
        if self.thisptr != NULL:
            del self.thisptr

    def alloc(self):
        cdef BaseIOtype baseio = BaseIOtype()
        #def BaseIOtype * Alloc(self):
        # let cpptraj free memory
        baseio.thisptr = self.thisptr.Alloc()
        return baseio

    def write_help(self):
        self.thisptr.WriteHelp()

    def id_parm_format(self, CpptrajFile fileIn):
        return self.thisptr.ID_ParmFormat(fileIn.thisptr[0])

    def process_read_args(self,ArgList arglist):
        return self.thisptr.processReadArgs(arglist.thisptr[0])

    def read_parm(self, string fname, Topology TopIn):
        return self.thisptr.ReadParm(fname, TopIn.thisptr[0])

    def process_write_args(self, ArgList argIn):
        self.thisptr.processWriteArgs(argIn.thisptr[0])

    def write_parm(self, string fname, Topology parmIn):
        return self.thisptr.WriteParm(fname, parmIn.thisptr[0])

    def set_debug(self,int debugIn):
        self.thisptr.SetDebug(debugIn)
