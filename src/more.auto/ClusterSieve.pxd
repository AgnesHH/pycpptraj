# distutils: language = c++


cdef extern from "ClusterSieve.h": 
    cdef cppclass _ClusterSieve "ClusterSieve":
        _ClusterSieve() 
        int SetSieve(int, size_t, int)
        int SetSieve(int, vector [bint] const &)
        Sieved_Frames _Frames() const 
        inline int _FrameToIdx(int frame)const 
        inline size_t Max_Frames() const 
        inline int Sieve() const 
        inline SieveType Type() const 
