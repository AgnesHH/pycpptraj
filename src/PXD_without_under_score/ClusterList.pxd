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
    cdef cppclass ClusterList "ClusterList":
        const char * MetricString(DistMetricType)
        ClusterList() 
        int Nclusters() const 
        void SetDebug(int)
        void Renumber(bint)
        void Summary(const string&, int)
        void Summary_Part(const string&, int, const vector[int]&)
        void PrintClustersToFile(const string&, int)
        void PrintClusters() 
        int CalcFrameDistances(const string&, const DsArray&, DistModeType, DistMetricType, bint, bint, const string&, int, int)
        const cluster_iterator begincluster() const 
        const cluster_iterator endcluster() const 
