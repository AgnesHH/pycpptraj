# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *
from DataSet_RemLog cimport *


cdef extern from "Analysis_RemLog.h": 
    cdef cppclass Analysis_RemLog "Analysis_RemLog":
        Analysis_RemLog() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
