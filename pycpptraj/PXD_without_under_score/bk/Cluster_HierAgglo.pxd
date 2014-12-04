# distutils: language = c++
from ClusterList cimport *


cdef extern from "Cluster_HierAgglo.h": 
    # Cluster_HierAgglo.h
    ctypedef enum LINKAGETYPE "Cluster_HierAgglo::LINKAGETYPE":
        SINGLELINK "Cluster_HierAgglo::SINGLELINK"
        AVERAGELINK "Cluster_HierAgglo::AVERAGELINK"
        COMPLETELINK "Cluster_HierAgglo::COMPLETELINK"
    cdef cppclass Cluster_HierAgglo "Cluster_HierAgglo":
        Cluster_HierAgglo() 
        void Help() 
        int SetupCluster(ArgList&)
        void ClusteringInfo() 
        int Cluster() 
        void AddSievedFrames() 
        void ClusterResults(CpptrajFile&) const 
