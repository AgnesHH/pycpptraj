# distutils: language = c++
from libcpp.string cimport string
from TrajectoryFile cimport *
from ProgressBar cimport *


cdef extern from "Trajin.h": 
    cdef cppclass Trajin "Trajin":
        Trajin() 
        int CheckFrameArgs(ArgList&, int, int&, int&, int&)
        inline bint CheckFinished() 
        inline void UpdateCounters() 
        inline int GetNextFrame(Frame&)
        inline void SetTotalFrames(int)
        int SetupTrajIO(const string&, TrajectoryIO&, ArgList&)
        int CheckBoxInfo(const char *, Box&, const Box&) const 
        int setupFrameInfo() 
        void PrepareForRead(bint)
        void PrintInfoLine() const 
        void PrintFrameInfo() const 
        int TotalFrames() const 
        int TotalReadFrames() const 
        int CurrentFrame() const 
        int Start() const 
        int Offset() const 
        int NumFramesProcessed() const 
        bint IsEnsemble() const 
        void SetEnsemble(bint b)
