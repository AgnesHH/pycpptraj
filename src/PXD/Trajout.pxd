# distutil: language = c++

from libcpp.string cimport string
from TrajectoryFile cimport *
from ActionFrameCounter cimport *
from Topology cimport *
from ArgList cimport *
from Frame cimport *

cdef extern from "Trajout.h":
    cdef cppclass _Trajout "Trajout":
        _Trajout()
        inline int  InitTrajWrite(const string&, _ArgList&, _Topology*,
                                  TrajFormatType)
        inline int InitTrajWrite(const string&, _Topology*, TrajFormatType)
        int InitStdoutTrajWrite(_ArgList&, _Topology*, TrajFormatType)
        int InitEnsembleTrajWrite(const string&, const _ArgList&,
                                  _Topology*, TrajFormatType, int)
        int InitTrajWriteWithArgs(const string&, const char*, _Topology*,
                                  TrajFormatType)
        void EndTraj()
        int WriteFrame(int, _Topology*, const _Frame&)
        void PrintInfo(int)
        bint TrajIsOpen()
        int NumFramesProcessed()

#cdef class Trajout:
#    cdef _Trajout* thisptr
