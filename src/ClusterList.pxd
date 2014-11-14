# distutil: language = c++

from libcpp.string cimport string
from libcpp.vector cimport vector
from ArgList cimport *
from ClusterNode cimport *

cdef extern from "ClusterList.h":
    ctypedef enum DistModeType "ClusterList::DistModeType":
        USE_FRAMES "ClusterList::USE_FRAMES"
        USE_FILE "ClusterList::USE_FILE"
    # ClusterList.h
    ctypedef enum DistMetricType "ClusterList::DistMetricType":
        RMS "ClusterList::RMS"
        DME "ClusterList::DME"
        SRMSD "ClusterList::SRMSD"
        DATA "ClusterList::DATA"
    cdef cppclass ClusterList:
       char * MetricString(DistMetricType)
       ClusterList()
       #virtual ~ClusterList
       int Nclusters()

       void SetDebug()
       void Renumber(bint)
       void Summary(string, int)
       void Summary_Part(string, int, vector[int]&)
       void PrintClustersToFile(string&, int)
       void PrintClusters()

       int CalcFrameDistances(string&, DsArray&, DistModeType, DistMetricType,
                              bint, bint, string&, int, int)
       #virtual int SetupCluster(ArgList&) = 0
       #virtual void ClusteringInfo() = o
       #virtual int Cluster() = 0

       #protected:
       #ClusterMatrix FrameDistances_


