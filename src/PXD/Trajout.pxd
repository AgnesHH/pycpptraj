# distutils: language = c++
from libcpp.string cimport string
from TrajectoryFile cimport *
from Range cimport *
from ActionFrameCounter cimport *


cdef extern from "Trajout.h": 
    cdef cppclass _Trajout "Trajout":
        _Trajout() 
        #~_Trajout() 
        inline int InitTrajWrite(const string&, _ArgList&, _Topology *, _TrajectoryFile::TrajFormatType)
        inline int InitTrajWrite(const string&, _Topology *, _TrajectoryFile::TrajFormatType)
        int InitStdoutTrajWrite(_ArgList&, _Topology *, _TrajectoryFile::TrajFormatType)
        int InitEnsembleTrajWrite(const string&, const _ArgList&, _Topology *, TrajFormatType, int)
        int InitTrajWriteWithArgs(const string&, const char *, _Topology *, _TrajectoryFile::TrajFormatType)
        void EndTraj() 
        int Write_Frame(int, _Topology *, const _Frame&)
        void PrintInfo(int) const 
        bint TrajIsOpen() const 
        int Num_FramesProcessed() const 


cdef class Trajout:
    cdef _Trajout* thisptr

