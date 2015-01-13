# distutils: language = c++
from pycpptraj.cpptraj_dict import ParmFormatDict

cdef class ParmFile:
    def __cinit__(self):
        self.thisptr = new _ParmFile()

    def __dealloc__(self):
        del self.thisptr

    @classmethod
    def help(cls):
        print "read_options"
        cls.read_options()

        print
        print "write_options"
        cls.write_options()

    @classmethod
    def read_options(cls):
        _ParmFile.ReadOptions()

    @classmethod
    def write_options(cls):
        _ParmFile.WriteOptions()

    def formats(cls):
        """return a list of supported parm formats"""
        return ParmFormatDict.keys()

    def readparm(self, Topology top=Topology(), string fname="", *args):
        """readparm(Topology top=Topology(), string fname="", "*args)
        Return : None (update `top`)

        top : Topology instance
        fname : str, output filename
        arglist : ArgList instance, optional

        """
        cdef ArgList arglist
        cdef debug = 0

        if not args:
            self.thisptr.ReadTopology(top.thisptr[0], fname, debug)
        else:
            arglist = <ArgList> args[0]
            self.thisptr.ReadTopology(top.thisptr[0], fname, arglist.thisptr[0], debug)

    def write_prefix_topology(self, Topology top=Topology(), string prefix="default", fmt=""):
        """write_prefix_topology(Topology Top, string prefix, fmt="AMBER")
        TODO : automatically get ParmFormatDict for this doc
        ParmFormatDict = {
            "AMBER" : AMBERPARM,
            "PDB" : PDBFILE,
            "MOL2" : MOL2FILE,
            "CHARMMPSF" : CHARMMPSF,
            "CIF" : CIFFILE,
            "SDF" : SDFFILE,
            "UNKNOWN" : UNKNOWN_PARM,
                         }
        TODO : do we need this method?
        """
        cdef debug = 0
        # TODO : combine with write_topology
        return self.thisptr.WritePrefixTopology(top.thisptr[0], prefix, ParmFormatDict[fmt], debug)

    def writeparm(self, Topology top=Topology(), string fname="default.top", 
                  ArgList arglist=ArgList(), string fmt="AMBER"):
        """writeparm(Topology top=top, string fname="default.top", 
                     ArgList arglist=ArgList(), string fmt="AMBER")")
        TODO : automatically get ParmFormatDict for this doc
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
        cdef int debug = 0
        # change `fmt` to upper
        fmt = fmt.upper()

        if top.is_empty():
            raise ValueError("empty topology")
        self.thisptr.WriteTopology(top.thisptr[0], fname, arglist.thisptr[0], ParmFormatDict[fmt], debug)

    def filename(self):
        cdef FileName fname = FileName()
        #del fname.thisptr
        fname.thisptr[0] = self.thisptr.ParmFilename()
        return fname
