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
        cdef string fnameIn
        cdef ArgList argListIn
        cdef debugIn = 0

        if len(args) == 2:
            Top, fnameIn = args
            self.thisptr.ReadTopology(Top.thisptr[0], fnameIn, debugIn)
        elif len(args) == 3:
            Top, fnameIn, argListIn= args
            self.thisptr.ReadTopology(Top.thisptr[0], fnameIn, argListIn.thisptr[0], debugIn)
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

    def write_topology(self, Topology Top, string fname, ArgList argListIn, ParmFormatType fmtIn, int debugIn):
        return self.thisptr.WriteTopology(Top.thisptr[0], fname, argListIn.thisptr[0], fmtIn, debugIn)

    def filename(self):
        cdef FileName fname = FileName()
        #del fname.thisptr
        fname.thisptr[0] = self.thisptr.ParmFilename()
        return fname
