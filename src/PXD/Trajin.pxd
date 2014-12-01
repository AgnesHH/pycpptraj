# distutils: language = c++
from TrajectoryFile cimport *
from ProgressBar cimport *


cdef extern from "Trajin.h": 
    cdef cppclass _Trajin "Trajin":
        _Trajin() 
        int Check_FrameArgs(_ArgList &, int, int &, int &, int &)
        inline bint CheckFinished() 
        inline void UpdateCounters() 
        inline int GetNext_Frame(_Frame &)
        inline void SetTotal_Frames(int)
        int SetupTrajIO(const string&, _TrajectoryIO &, _ArgList &)
        int Check_BoxInfo(const char *, _Box &, const _Box&)const 
        int setup_FrameInfo() 
        void PrepareForRead(bint)
        void PrintInfoLine() const 
        void Print_FrameInfo() const 
        int Total_Frames() const 
        int TotalRead_Frames() const 
        int Current_Frame() const 
        int Start() const 
        int Offset() const 
        int Num_FramesProcessed() const 
        bint IsEnsemble() const 
        void SetEnsemble(bint b)
