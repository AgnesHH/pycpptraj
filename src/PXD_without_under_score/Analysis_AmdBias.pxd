# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_AmdBias.h": 
    cdef cppclass Analysis_AmdBias "Analysis_AmdBias":
        Analysis_AmdBias() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
