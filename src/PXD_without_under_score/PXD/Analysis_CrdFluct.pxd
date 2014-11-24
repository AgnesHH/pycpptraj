# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *
from DataSet_Coords cimport *


cdef extern from "Analysis_CrdFluct.h": 
    cdef cppclass Analysis_CrdFluct "Analysis_CrdFluct":
        Analysis_CrdFluct() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
