# distutils: language = c++
from libcpp.map cimport map


cdef extern from "OnlineVarT.h": 
    cdef cppclass Stats "Stats"[T]:
        Stats()
        void accumulate(const T)
        T mean()
        T variance()
        T nData()
    cdef cppclass StatsMap "StatsMap" [Key, Value]:
        StatsMap() 
        void accumulate(map[Key, Value] a)
        Value mean(Key i)
        Value variance(Key i)
        #iterator mean_begin() 
        #iterator mean_end() 
        #iterator variance_begin() 
        #iterator variance_end() 
        Value nData() const 
