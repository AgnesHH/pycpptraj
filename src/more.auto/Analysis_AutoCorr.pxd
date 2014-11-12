# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_AutoCorr.h": 
    cdef cpplass _Analysis_AutoCorr "Analysis_AutoCorr":
        _Analysis_AutoCorr() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
