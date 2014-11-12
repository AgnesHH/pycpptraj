# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Regression.h": 
    cdef cpplass _Analysis_Regression "Analysis_Regression":
        _Analysis_Regression() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
