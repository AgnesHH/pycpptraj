# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_CrossCorr.h": 
    cdef cppclass _Analysis_CrossCorr "Analysis_CrossCorr":
        _Analysis_CrossCorr() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
