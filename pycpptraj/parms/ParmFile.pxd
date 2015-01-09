# distutils: language = c++
from libcpp.string cimport string
from pycpptraj.parms.ParmIO cimport _ParmIO, ParmIO
from pycpptraj.FileTypes cimport _FileTypes, FileTypes
from pycpptraj.FileName cimport _FileName, FileName
from pycpptraj.Topology cimport _Topology, Topology
from pycpptraj.ArgList cimport _ArgList, ArgList


cdef extern from "ParmFile.h": 
    ctypedef enum ParmFormatType "ParmFile::ParmFormatType":
        AMBERPARM "ParmFile::AMBERPARM"
        PDBFILE "ParmFile::PDBFILE"
        MOL2FILE "ParmFile::MOL2FILE"
        CHARMMPSF "ParmFile::CHARMMPSF"
        CIFFILE "ParmFile::CIFFILE"
        SDFFILE "ParmFile::SDFFILE"
        UNKNOWN_PARM "ParmFile::UNKNOWN_PARM"
    cdef cppclass _ParmFile "ParmFile":
        void ReadOptions() 
        void WriteOptions() 
        _ParmFile() 
        int ReadTopology(_Topology&, const string&, const _ArgList&, int)
        int ReadTopology(_Topology& t, const string& n, int d)
        int WritePrefixTopology(const _Topology&, const string&, ParmFormatType, int)
        int WriteTopology(const _Topology&, const string&, const _ArgList&, ParmFormatType, int)
        int WriteTopology(const _Topology& t, const string& n, ParmFormatType f, int d)
        const _FileName ParmFilename() 


cdef class ParmFile:
    cdef _ParmFile* thisptr

