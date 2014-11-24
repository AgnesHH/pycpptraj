# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_Corr.h": 
    cdef cppclass Analysis_Corr "Analysis_Corr":
        Analysis_Corr() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
