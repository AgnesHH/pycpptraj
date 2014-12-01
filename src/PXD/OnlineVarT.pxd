# distutils: language = c++
from libcpp.map cimport map


cdef extern from "OnlineVarT.h": 
    cdef cppclass _Stats "Stats" [Float]:
        _Stats()
        void accumulate(const Float)
        Float mean()
        Float variance()
        Float nData()
    cdef cppclass _StatsMap "StatsMap" [Key, Value]:
        _StatsMap() 
        void accumulate(map[Key, Value] a)
        Value mean(Key i)
        Value variance(Key i)
        #iterator mean_begin() 
        #iterator mean_end() 
        #iterator variance_begin() 
        #iterator variance_end() 
        Value nData() const 
