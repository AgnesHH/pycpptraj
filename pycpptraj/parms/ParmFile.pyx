# distutils: language = c++
from pycpptraj.cpptraj_dict import ParmFormatDict


cdef class ParmFile:
    def __cinit__(self):
        self.thisptr = new _ParmFile()

    def __dealloc__(self):
        del self.thisptr

    def read_options(self):
        self.thisptr.ReadOptions()

    def write_options(self):
        self.thisptr.WriteOptions()

    def readparm(self, *args):
        cdef Topology Top
        cdef string fname
        cdef ArgList arglist
        cdef debug = 0

        if len(args) == 2:
            Top, fname = args
            self.thisptr.ReadTopology(Top.thisptr[0], fname, debug)
        elif len(args) == 3:
            Top, fname, arglist= args
            self.thisptr.ReadTopology(Top.thisptr[0], fname, arglist.thisptr[0], debug)
        else:
            raise ValueError("Must have topology instance, filename and (optionl) ArgList instance")

    def write_prefix_topology(self, Topology Top, string prefix, fmt="AMBER"):
        """
        ParmFormatDict = {
            "AMBER" : AMBERPARM,
            "PDB" : PDBFILE,
            "MOL2" : MOL2FILE,
            "CHARMMPSF" : CHARMMPSF,
            "CIF" : CIFFILE,
            "SDF" : SDFFILE,
            "UNKNOWN" : UNKNOWN_PARM,
                         }
        """
        cdef debug = 0
        # TODO : combine with write_topology
        return self.thisptr.WritePrefixTopology(Top.thisptr[0], prefix, ParmFormatDict[fmt], debug)

    def writeparm(self, Topology Top, string fname, ArgList arglist, ParmFormatType fmtIn, int debug):
        self.thisptr.WriteTopology(Top.thisptr[0], fname, arglist.thisptr[0], fmtIn, debug)

    def filename(self):
        cdef FileName fname = FileName()
        #del fname.thisptr
        fname.thisptr[0] = self.thisptr.ParmFilename()
        return fname
