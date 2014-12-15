# distutil: language = c++

from DispatchObject cimport *
from DataSetList cimport *
from DataFileList cimport *
from TopologyList cimport *

cdef extern from "Analysis.h":
    enum RetType:
        OK
        ERR
    cdef cppclass _Analysis "Analysis":
        pass
        
#cdef class Analysis:
#    cdef _Analysis* thisptr
