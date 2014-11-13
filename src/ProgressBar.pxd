# distutils: language = c++


cdef extern from "ProgressBar.h": 
    cdef cppclass _ParallelProgress "ParallelProgress":
        _ParallelProgress() : C_over_max_(1.0 ), tgt_(0.0 ), thread_(0)
        _ParallelProgress(int m): C_over_max_(100.0 /(float)m ), tgt_(0.0 ), thread_(0)
        _ParallelProgress(const _ParallelProgress &)
        void SetThread(int t)
        void Update(int it)
        void Finish() 
