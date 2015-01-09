# distutils: language = c++
from __future__ import absolute_import
from libcpp.string cimport string
from pycpptraj.trajs.TrajectoryIO cimport *
from pycpptraj.FileTypes cimport *
from pycpptraj.ArgList cimport *
from pycpptraj.Topology cimport *


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
        void SetTrajFileName(const string&, bint)
        int SetTrajParm(_Topology *)
        _Topology * TrajParm ()const 
        const _FileName & TrajFilename ()const 


TrajFormatType_dict = {
        AMBERNETCDF : "AMBERNETCDF",
        AMBERRESTARTNC : "AMBERRESTARTNC",
        PDBFILE : "PDBFILE",
        MOL2FILE : "MOL2FILE",
        CIF : "CIF",
        CHARMMDCD : "CHARMMDCD",
        GMXTRX : "GMXTRX",
        BINPOS : "BINPOS",
        AMBERRESTART : "AMBERRESTART",
        AMBERTRAJ : "AMBERTRAJ",
        SQM : "SQM",
        SDF : "SDF",
        CONFLIB : "CONFLIB",
        UNKNOWN_TRAJ : "UNKNOWN_TRAJ",
}

cdef class TrajectoryFile:
    cdef _TrajectoryFile* baseptr0
    cdef Topology _top
