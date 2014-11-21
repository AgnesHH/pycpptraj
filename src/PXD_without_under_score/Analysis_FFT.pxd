# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_FFT.h": 
    cdef cppclass Analysis_FFT "Analysis_FFT":
        Analysis_FFT() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
