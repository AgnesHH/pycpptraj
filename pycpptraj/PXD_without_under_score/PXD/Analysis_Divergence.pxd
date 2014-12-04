# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *


cdef extern from "Analysis_Divergence.h": 
    cdef cppclass Analysis_Divergence "Analysis_Divergence":
        Analysis_Divergence() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
