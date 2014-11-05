# distutil: language = c++

from ClusterList cimport *

cdef extern from "Cluster_HierAgglo.h":
    ctypedef enum LINKAGETYPE  "Cluster_HierAgglo::LINKAGETYPE"
    cdef cppclass _Cluster_HierAgglo "Cluster_HierAgglo``":
        _Cluster_HierAgglo()
        void Help()
        int SetupCluster(_ArgList&)
        void ClusteringInfo()
        int Cluster()
        void AddSievedFrames()
        void ClusterResults(_CpptrajFile&)
        
cdef class Cluster_HierAgglo:
    cdef _Cluster_HierAgglo* thisptr
