# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Regression.h": 
    cdef cppclass _Analysis_Regression "Analysis_Regression":
        _Analysis_Regression() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
