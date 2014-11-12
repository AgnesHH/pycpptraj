# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Lifetime.h": 
    cdef cpplass _Analysis_Lifetime "Analysis_Lifetime":
        _Analysis_Lifetime() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(Array1const D&)
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
