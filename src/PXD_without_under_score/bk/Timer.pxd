# distutils: language = c++


cdef extern from "Timer.h": 
    cdef cppclass Timer "Timer":
        Timer() 
        void Start() 
        void Stop() 
        double Total() const 
        void WriteTiming(int, const char *, double) const 
        void WriteTiming(int i, const char * h) const 
