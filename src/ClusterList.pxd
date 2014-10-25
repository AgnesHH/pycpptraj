# distutil: language = c++

from libcpp.string cimport string
from libcpp.vector cimport vector
from ArgList cimport *
from ClusterNode cimport *

cdef extern from "ClusterList.h":
    cdef cppclass ClusterList:
       #enum DistModeType   { USE_FRAMES = 0, USE_FILE   }
       #enum DistMetricType { RMS = 0, DME, SRMSD, DATA  }
       char * MetricString(DistMetricType)
       ClusterList()
       virtual ~ClusterList
       int Nclusters()

       void SetDebug()
       void Renumber(bint)
       void Summary(string, int)
       void Summary_Part(string, int, vector[int]&)
       void PrintClustersToFile(string&, int)
       void PrintClusters()

       int CalcFrameDistances(string&, DsArray&, DistModeType, DistMetricType,
                              bint, bint, string&, int, int)
       virtual int SetupCluster(ArgList&) = 0
       virtual void ClusteringInfo() = o
       virtual int Cluster() = 0

