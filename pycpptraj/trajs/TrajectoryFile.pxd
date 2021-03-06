# distutils: language = c++
from __future__ import absolute_import
from libcpp.string cimport string
from pycpptraj.trajs.TrajectoryIO cimport _TrajectoryIO, TrajectoryIO
from pycpptraj.FileTypes cimport _FileTypes, FileTypes
from pycpptraj.FileName cimport *
from pycpptraj.FileTypes cimport AllocToken, KeyToken
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.Topology cimport _Topology, Topology


cdef extern from "TrajectoryFile.h": 
    ctypedef enum TrajFormatType "TrajectoryFile::TrajFormatType":
        pass
        #AMBERNETCDF "TrajectoryFile::AMBERNETCDF"
        #AMBERRESTARTNC "TrajectoryFile::AMBERRESTARTNC"
        #PDBFILE "TrajectoryFile::PDBFILE"
        #MOL2FILE "TrajectoryFile::MOL2FILE"
        #CIF "TrajectoryFile::CIF"
        #CHARMMDCD "TrajectoryFile::CHARMMDCD"
        #GMXTRX "TrajectoryFile::GMXTRX"
        #BINPOS "TrajectoryFile::BINPOS"
        #AMBERRESTART "TrajectoryFile::AMBERRESTART"
        #AMBERTRAJ "TrajectoryFile::AMBERTRAJ"
        #SQM "TrajectoryFile::SQM"
        #SDF "TrajectoryFile::SDF"
        #CONFLIB "TrajectoryFile::CONFLIB"
        #UNKNOWN_TRAJ "TrajectoryFile::UNKNOWN_TRAJ"

    cdef cppclass _TrajectoryFile "TrajectoryFile":
        @staticmethod
        AllocToken TF_AllocArray[] 
        @staticmethod
        KeyToken TF_KeyArray[]
        _TrajectoryFile ()
        @staticmethod
        void ReadOptions ()
        @staticmethod
        void WriteOptions ()
        @staticmethod
        TrajFormatType GetFormatFromArg(_ArgList & a)
        @staticmethod
        TrajFormatType GetFormatFromString(const string& s)
        @staticmethod
        string GetExtensionForType(TrajFormatType t)
        @staticmethod
        TrajFormatType GetTypeFromExtension(const string& e)
        @staticmethod
        const char * FormatString(TrajFormatType tt)
        void SetDebug(int)
        void SetTrajFileName(const string&, bint)
        int SetTrajParm(_Topology *)
        _Topology * TrajParm ()const 
        const _FileName & TrajFilename ()const 


cdef class TrajectoryFile:
    cdef _TrajectoryFile* baseptr0
    cdef Topology _top
