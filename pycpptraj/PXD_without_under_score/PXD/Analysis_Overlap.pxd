# distutils: language = c++
from Analysis cimport *


cdef extern from "Analysis_Overlap.h": 
    cdef cppclass Analysis_Overlap "Analysis_Overlap":
        Analysis_Overlap() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
