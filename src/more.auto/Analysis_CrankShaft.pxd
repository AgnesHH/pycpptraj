# distutils: language = c++
from Analysis cimport *
from DataSet_1D cimport *


cdef extern from "Analysis_CrankShaft.h": 
    cdef cpplass _Analysis_CrankShaft "Analysis_CrankShaft":
        _Analysis_CrankShaft() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
