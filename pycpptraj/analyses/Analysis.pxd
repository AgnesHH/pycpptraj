# distutils: language = c++
from DispatchObject cimport *
from ArgList cimport *
from DataSetList cimport *
from DataFileList cimport *
from TopologyList cimport *


cdef extern from "Analysis.h": 
    # Analysis.h
    ctypedef enum RetType "Analysis::RetType":
        OK "Analysis::OK"
        ERR "Analysis::ERR"
    cdef cppclass _Analysis "Analysis":
        #virtual ~_Analysis() 
        RetType Setup(_ArgList&, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze()


cdef class Analysis:
    cdef _Analysis* baseptr
