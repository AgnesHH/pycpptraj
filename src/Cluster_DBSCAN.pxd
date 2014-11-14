# distutils: language = c++
from ClusterList cimport *


cdef extern from "Cluster_DBSCAN.h": 
    cdef cppclass _Cluster_DBSCAN "Cluster_DBSCAN":
        _Cluster_DBSCAN() 
        void Help() 
        int SetupCluster(_ArgList&)
        void ClusteringInfo() 
        int Cluster() 
        void AddSieved_Frames() 
        void ClusterResults(_CpptrajFile&) const 
