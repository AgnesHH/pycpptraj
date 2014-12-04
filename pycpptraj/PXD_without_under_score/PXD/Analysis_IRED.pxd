# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Analysis cimport *
from DataSet_Vector cimport *
from DataSet_Modes cimport *


cdef extern from "Analysis_IRED.h": 
    cdef cppclass Analysis_IRED "Analysis_IRED":
        Analysis_IRED() 
        DispatchObject * Alloc() 
        void Help() 
        #~Analysis_IRED() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
