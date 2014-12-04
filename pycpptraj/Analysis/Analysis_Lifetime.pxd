# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Lifetime.h": 
    cdef cppclass _Analysis_Lifetime "Analysis_Lifetime":
        _Analysis_Lifetime() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(const _Array1D&)
        RetType Setup(_ArgList&, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 