# distutils: language = c++
from libcpp.string cimport string
from TrajectoryIO cimport *
from FileTypes cimport *
from ArgList cimport *
from Topology cimport *


cdef extern from "TrajectoryFile.h": 
    ctypedef enum TrajFormatType "TrajectoryFile::TrajFormatType":
        AMBERNETCDF "TrajectoryFile::AMBERNETCDF"
        AMBERRESTARTNC "TrajectoryFile::AMBERRESTARTNC"
        PDBFILE "TrajectoryFile::PDBFILE"
        MOL2FILE "TrajectoryFile::MOL2FILE"
        CIF "TrajectoryFile::CIF"
        CHARMMDCD "TrajectoryFile::CHARMMDCD"
        GMXTRX "TrajectoryFile::GMXTRX"
        BINPOS "TrajectoryFile::BINPOS"
        AMBERRESTART "TrajectoryFile::AMBERRESTART"
        AMBERTRAJ "TrajectoryFile::AMBERTRAJ"
        SQM "TrajectoryFile::SQM"
        SDF "TrajectoryFile::SDF"
        CONFLIB "TrajectoryFile::CONFLIB"
        UNKNOWN_TRAJ "TrajectoryFile::UNKNOWN_TRAJ"

    cdef cppclass _TrajectoryFile "TrajectoryFile":
        _TrajectoryFile ()
        void ReadOptions ()
        void WriteOptions ()
        TrajFormatType GetFormatFromArg(_ArgList & a)
        TrajFormatType GetFormatFromString(const string& s)
        string GetExtensionForType(TrajFormatType t)
        TrajFormatType GetTypeFromExtension(const string& e)
        const char * FormatString(TrajFormatType tt)
        void SetDebug(int)
        void SetTraj_FileName(const string&, bint)
        int SetTrajParm(_Topology *)
        _Topology * TrajParm ()const 
        const _FileName & TrajFilename ()const 
