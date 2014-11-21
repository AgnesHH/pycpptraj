# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *


cdef extern from "Analysis_AutoCorr.h": 
    cdef cppclass Analysis_AutoCorr "Analysis_AutoCorr":
        Analysis_AutoCorr() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
