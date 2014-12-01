# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_MeltCurve.h": 
    cdef cppclass _Analysis_MeltCurve "Analysis_MeltCurve":
        _Analysis_MeltCurve()
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
