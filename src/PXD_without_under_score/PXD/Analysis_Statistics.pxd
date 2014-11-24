# distutils: language = c++
from libcpp.string cimport string
from Analysis cimport *
from Array1D cimport *
from DataSet_integer cimport *
from DataSet_float cimport *
from DataSet_string cimport *


cdef extern from "Analysis_Statistics.h": 
    cdef cppclass Analysis_Statistics "Analysis_Statistics":
        Analysis_Statistics() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
