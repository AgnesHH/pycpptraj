# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_Corr.h": 
    cdef cpplass _Analysis_Corr "Analysis_Corr":
        _Analysis_Corr() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
