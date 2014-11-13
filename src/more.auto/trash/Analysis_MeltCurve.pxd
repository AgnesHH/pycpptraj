# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_MeltCurve.h": 
    cdef cpplass _Analysis_MeltCurve "Analysis_MeltCurve":
        _Analysis_MeltCurve() : mcurve_(0 ), cut_(0.0)
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
