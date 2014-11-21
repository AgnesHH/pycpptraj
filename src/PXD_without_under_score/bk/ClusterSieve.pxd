# distutils: language = c++
from libcpp.vector cimport vector


cdef extern from "ClusterSieve.h": 
    # ClusterSieve.h
    ctypedef enum SieveType "ClusterSieve::SieveType":
        NONE "ClusterSieve::NONE"
        REGULAR "ClusterSieve::REGULAR"
        RANDOM "ClusterSieve::RANDOM"
    cdef cppclass ClusterSieve "ClusterSieve":
        ClusterSieve() 
        int SetSieve(int, size_t, int)
        int SetSieve(int, const vector[bint]&)
        SievedFrames Frames() const 
        inline int FrameToIdx(int frame) const 
        inline size_t MaxFrames() const 
        inline int Sieve() const 
        inline SieveType Type() const 
