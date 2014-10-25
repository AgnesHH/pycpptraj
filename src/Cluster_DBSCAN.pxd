# distutil: language = c++
from ClusterList cimport *

cdef extern from "Cluster_DBSCAN.h":
    cdef cppclass Cluster_DBSCAN:
        Cluster_DBSCAN()
        void Help()
        int SetupCluster(ArgList&)
        void ClusteringInfo()
        int Cluster()
        void AddSievedFrames()
        void ClusterResults(CpptrajFile&)

