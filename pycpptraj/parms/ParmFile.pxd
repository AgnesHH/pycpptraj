# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *
from FileTypes cimport *
from FileName cimport _FileName, FileName


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
        const _FileName ParmFilename() except +ValueError


cdef class ParmFile:
    cdef _ParmFile* thisptr

