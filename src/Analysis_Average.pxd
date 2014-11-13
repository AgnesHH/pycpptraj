# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Average.h": 
    cdef cppclass _Analysis_Average "Analysis_Average":
        _Analysis_Average() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
