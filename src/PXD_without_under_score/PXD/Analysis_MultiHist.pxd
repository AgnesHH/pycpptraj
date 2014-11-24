# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *


cdef extern from "Analysis_MultiHist.h": 
    cdef cppclass Analysis_MultiHist "Analysis_MultiHist":
        Analysis_MultiHist() 
        #~Analysis_MultiHist() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
