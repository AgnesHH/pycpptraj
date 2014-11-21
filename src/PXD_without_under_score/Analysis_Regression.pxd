# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Regression.h": 
    cdef cppclass Analysis_Regression "Analysis_Regression":
        Analysis_Regression() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
