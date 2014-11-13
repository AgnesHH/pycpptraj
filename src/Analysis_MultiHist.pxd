# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_MultiHist.h": 
    cdef cppclass _Analysis_MultiHist "Analysis_MultiHist":
        _Analysis_MultiHist() 
        #~_Analysis_MultiHist() 
        _DispatchObject * Alloc() 
        void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
