# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Analysis cimport *
from ClusterList cimport *
from TrajectoryFile cimport *
from DataSet_Coords cimport *


cdef extern from "Analysis_Clustering.h": 
    cdef cppclass Analysis_Clustering "Analysis_Clustering":
        Analysis_Clustering() 
        #~Analysis_Clustering() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
