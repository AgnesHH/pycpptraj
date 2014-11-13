# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_FFT.h": 
    cdef cppclass _Analysis_FFT "Analysis_FFT":
        _Analysis_FFT() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
