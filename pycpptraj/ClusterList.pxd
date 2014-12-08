# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from ArgList cimport *
from ClusterNode cimport *


cdef extern from "ClusterList.h": 
    # ClusterList.h
    ctypedef enum DistModeType "ClusterList::DistModeType":
        USE_FRAMES "ClusterList::USE_FRAMES"
        USE_FILE "ClusterList::USE_FILE"
    # ClusterList.h
    ctypedef enum DistMetricType "ClusterList::DistMetricType":
        RMS "ClusterList::RMS"
        DME "ClusterList::DME"
        SRMSD "ClusterList::SRMSD"
        DATA "ClusterList::DATA"
    cdef cppclass _ClusterList "ClusterList":
        const char * MetricString(DistMetricType)
        _ClusterList() 
        #virtual ~_ClusterList() 
        int Nclusters() const 
        void SetDebug(int)
        void Renumber(bint)
        void Summary(const string&, int)
        void Summary_Part(const string&, int, const vector[int]&)
        void PrintClustersToFile(const string&, int)
        void PrintClusters() 
        int CalcFrameDistances(const string&, DsArray&, DistModeType, DistMetricType, bint, bint, const string&, int, int)
        #virtual int SetupCluster(_ArgList&)= 0 
        #virtual void ClusteringInfo() = 0 
        #virtual int Cluster() = 0 
        const cluster_iterator begincluster() const 
        const cluster_iterator endcluster() const 


cdef class ClusterList:
    cdef _ClusterList* thisptr

