# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_Corr.h": 
    cdef cppclass _Analysis_Corr "Analysis_Corr":
        _Analysis_Corr() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
