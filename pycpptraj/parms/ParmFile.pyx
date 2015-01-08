# distutils: language = c++


cdef class ParmFile:
    def __cinit__(self):
        self.thisptr = new _ParmFile()

    def __dealloc__(self):
        del self.thisptr

    def read_options(self):
        self.thisptr.ReadOptions()

    def write_options(self):
        self.thisptr.WriteOptions()

    def read_topology(self, *args):
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

    def write_prefix_topology(self, Topology Top, string prefix, ParmFormatType fmtIn, int debugIn):
        return self.thisptr.WritePrefixTopology(Top.thisptr[0], prefix, fmtIn, debugIn)


    def write_topology(self, Topology Top, string fname, ArgList argListIn, ParmFormatType fmtIn, int debugIn):
        return self.thisptr.WriteTopology(Top.thisptr[0], fname, argListIn.thisptr[0], fmtIn, debugIn)

    def parm_filename(self):
        cdef FileName fname = FileName()
        #del fname.thisptr
        fname.thisptr[0] = self.thisptr.ParmFilename()
        return fname
