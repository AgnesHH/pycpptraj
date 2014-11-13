# distutils: language = c++
from Analysis cimport *
from DataSet_RemLog cimport *


cdef extern from "Analysis_RemLog.h": 
    cdef cppclass _Analysis_RemLog "Analysis_RemLog":
        _Analysis_RemLog() 
        _DispatchObject * Alloc() 
        void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
