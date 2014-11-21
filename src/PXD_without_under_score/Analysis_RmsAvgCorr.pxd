# distutils: language = c++
from libcpp.string cimport string
from Analysis cimport *
from DataSet_Coords cimport *


cdef extern from "Analysis_RmsAvgCorr.h": 
    cdef cppclass Analysis_RmsAvgCorr "Analysis_RmsAvgCorr":
        Analysis_RmsAvgCorr() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
