# distutils: language = c++
from Analysis cimport *
from DataSet_Vector cimport *
from DataSet_Modes cimport *


cdef extern from "Analysis_IRED.h": 
    cdef cppclass _Analysis_IRED "Analysis_IRED":
        _Analysis_IRED() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Analysis_IRED() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
