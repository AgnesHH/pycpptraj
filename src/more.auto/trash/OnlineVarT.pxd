# distutils: language = c++


cdef extern from "OnlineVarT.h": 
    cdef cpplass _StatsMap "StatsMap":
        _StatsMap() : n_(0.0)
        void accumulate(map [Key, Value] a)
        Value mean(Key i)
        Value variance(Key i)
        iterator mean_begin() 
        iterator mean_end() 
        iterator variance_begin() 
        iterator variance_end() 
        Value nData() const 
