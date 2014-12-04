# distutils: language = c++
from libcpp.vector cimport vector
from ClusterList cimport *


cdef extern from "Cluster_DBSCAN.h": 
    cdef cppclass Cluster_DBSCAN "Cluster_DBSCAN":
        Cluster_DBSCAN() 
        void Help() 
        int SetupCluster(ArgList&)
        void ClusteringInfo() 
        int Cluster() 
        void AddSievedFrames() 
        void ClusterResults(CpptrajFile&) const 
