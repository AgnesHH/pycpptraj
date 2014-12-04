# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_CrossCorr.h": 
    cdef cppclass Analysis_CrossCorr "Analysis_CrossCorr":
        Analysis_CrossCorr() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
