# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_RunningAvg.h": 
    cdef cppclass _Analysis_RunningAvg "Analysis_RunningAvg":
        _Analysis_RunningAvg() 
        _DispatchObject * Alloc() 
        void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
