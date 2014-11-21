# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_RunningAvg.h": 
    cdef cppclass Analysis_RunningAvg "Analysis_RunningAvg":
        Analysis_RunningAvg() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
