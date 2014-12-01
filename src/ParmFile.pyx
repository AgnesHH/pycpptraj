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
        elif len(args) == 4:
            Top, fnameIn, argListIn, debugIn = args
            return self.thisptr.ReadTopology(Top.thisptr[0], fnameIn, argListIn.thisptr[0], debugIn)
        else:
            raise ValueError()

    def WritePrefixTopology(self, Topology Top, string prefix, ParmFormatType fmtIn, int debugIn):
        return self.thisptr.WritePrefixTopology(Top.thisptr[0], prefix, fmtIn, debugIn)


    def WriteTopology(self, Topology Top, string fname, ArgList argListIn, ParmFormatType fmtIn, int debugIn):
        return self.thisptr.WriteTopology(Top.thisptr[0], fname, argListIn.thisptr[0], fmtIn, debugIn)

    def ParmFilename(self):
        cdef FileName fname = FileName()
        del fname.thisptr
        fname.thisptr[0] = self.thisptr.ParmFilename()
        return fname
