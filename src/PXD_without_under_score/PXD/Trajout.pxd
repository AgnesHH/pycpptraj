# distutils: language = c++
from libcpp.string cimport string
from TrajectoryFile cimport *
from Range cimport *
from ActionFrameCounter cimport *


cdef extern from "Trajout.h": 
    cdef cppclass Trajout "Trajout":
        Trajout() 
        #~Trajout() 
        inline int InitTrajWrite(const string&, ArgList&, Topology *, TrajFormatType)
        inline int InitTrajWrite(const string&, Topology *, TrajFormatType)
        int InitStdoutTrajWrite(ArgList&, Topology *, TrajFormatType)
        int InitEnsembleTrajWrite(const string&, const ArgList&, Topology *, TrajFormatType, int)
        int InitTrajWriteWithArgs(const string&, const char *, Topology *, TrajFormatType)
        void EndTraj() 
        int WriteFrame(int, Topology *, const Frame&)
        void PrintInfo(int) const 
        bint TrajIsOpen() const 
        int NumFramesProcessed() const 
