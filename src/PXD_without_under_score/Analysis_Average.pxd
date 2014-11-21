# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Average.h": 
    cdef cppclass Analysis_Average "Analysis_Average":
        Analysis_Average() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
