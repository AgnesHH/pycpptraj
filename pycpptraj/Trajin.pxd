# distutils: language = c++
from TrajectoryFile cimport *
from ProgressBar cimport *


cdef extern from "Trajin.h": 
    cdef cppclass _Trajin "Trajin":
        _Trajin() 
        int CheckFrameArgs(_ArgList &, int, int &, int &, int &)
        inline bint CheckFinished() 
        inline void UpdateCounters() 
        inline int GetNextFrame(_Frame &)
        inline void SetTotalFrames(int)
        int SetupTrajIO(const string&, _TrajectoryIO &, _ArgList &)
        int CheckBoxInfo(const char *, _Box &, const _Box&)const 
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


cdef class Trajin:
    cdef _Trajin* thisptr
