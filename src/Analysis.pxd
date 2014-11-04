# distutil: language = c++

from DispatchObject cimport *
from Analysis cimport *
from DataSetList cimport *
from DataFileList cimport *
from TopologyList cimport *

cdef extern from "Analysis.h":
    enum RetType "Analysis::RetType":
        OK "Analysis::RetType::OK"
        ERR "Analysis::RetType::ERR"
    cdef cppclass _Analysis "Analysis":
        pass
        
cdef class Analysis:
    cdef _Analysis* thisptr
