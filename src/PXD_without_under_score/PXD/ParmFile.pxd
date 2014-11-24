# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *
from FileTypes cimport *


cdef extern from "ParmFile.h": 
    # ParmFile.h
    ctypedef enum ParmFormatType "ParmFile::ParmFormatType":
        AMBERPARM "ParmFile::AMBERPARM"
        PDBFILE "ParmFile::PDBFILE"
        MOL2FILE "ParmFile::MOL2FILE"
        CHARMMPSF "ParmFile::CHARMMPSF"
        CIFFILE "ParmFile::CIFFILE"
        SDFFILE "ParmFile::SDFFILE"
        UNKNOWN_PARM "ParmFile::UNKNOWN_PARM"
    cdef cppclass ParmFile "ParmFile":
        void ReadOptions() 
        void WriteOptions() 
        ParmFile() 
        int ReadTopology(Topology&, const string&, const ArgList&, int)
        int ReadTopology(Topology& t, const string& n, int d)
        int WritePrefixTopology(const Topology&, const string&, ParmFormatType, int)
        int WriteTopology(const Topology&, const string&, const ArgList&, ParmFormatType, int)
        int WriteTopology(const Topology& t, const string& n, ParmFormatType f, int d)
        const FileName& ParmFilename() 
