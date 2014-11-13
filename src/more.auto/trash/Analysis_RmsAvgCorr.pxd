# distutils: language = c++
from Analysis cimport *
from DataSet_Coords cimport *


cdef extern from "Analysis_RmsAvgCorr.h": 
    cdef cpplass _Analysis_RmsAvgCorr "Analysis_RmsAvgCorr":
        _Analysis_RmsAvgCorr() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
