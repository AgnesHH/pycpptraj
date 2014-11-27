# distutils: language = c++


cdef class ParmFile:
    def __cinit__(self):
        self.thisptr = new _ParmFile()

    def __dealloc__(self):
        del self.thisptr

    def ReadOptions(self):
        self.thisptr.ReadOptions()

    def WriteOptions(self):
        self.thisptr.WriteOptions()

    def ReadTopology(self, *args):
        cdef Topology Top
        cdef string fnameIn
        cdef ArgList argListIn
        cdef int debugIn

        if len(args) == 3:
            Top, fnameIn, debugIn = args
            return self.thisptr.ReadTopology(Top.thisptr[0], fnameIn, debugIn)
        elif len(args) == 3:
            Top, fnameIn, argListIn, debugIn = args
            return self.thisptr.ReadTopology(Top.thisptr[0], fnameIn, argListIn.thisptr[0], debugIn)
        else:
            raise ValueError()

    def ReadTopology(self,Topology Top, string fnameIn, int debugIn):
        return self.thisptr.ReadTopology(Top.thisptr[0], fnameIn, debugIn)

    #def int WritePrefixTopology(self, Topology, string, ParmFormatType, int):

    #def int WriteTopology(self, Topology, string, ArgList, ParmFormatType, int):

    #def int WriteTopology(self, Topology t, string n, ParmFormatType f, int d):

    #def  FileName ParmFilename(self):

