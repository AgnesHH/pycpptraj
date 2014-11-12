# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_AmdBias.h": 
    cdef cpplass _Analysis_AmdBias "Analysis_AmdBias":
        _Analysis_AmdBias() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
