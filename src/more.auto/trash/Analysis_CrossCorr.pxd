# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_CrossCorr.h": 
    cdef cpplass _Analysis_CrossCorr "Analysis_CrossCorr":
        _Analysis_CrossCorr() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
