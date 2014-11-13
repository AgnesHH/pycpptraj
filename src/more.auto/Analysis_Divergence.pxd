# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_Divergence.h": 
    cdef cppclass _Analysis_Divergence "Analysis_Divergence":
        _Analysis_Divergence() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
