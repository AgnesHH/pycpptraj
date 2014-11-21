# distutils: language = c++


cdef extern from "ProgressBar.h": 
    cdef cppclass ParallelProgress "ParallelProgress":
        ParallelProgress() : C_over_max_(1.0 ), tgt_(0.0 ), thread_(0)
        ParallelProgress(int m): C_over_max_(100.0 /(float)m ), tgt_(0.0 ), thread_(0)
        ParallelProgress(const ParallelProgress&)
        void SetThread(int t)
        void Update(int it)
        void Finish() 
    cdef cppclass ProgressBar "ProgressBar":
        ProgressBar() 
        ProgressBar(int)
        void SetupProgress(int)
        void Update(int)
