# distutils: language = c++
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_MeltCurve.h": 
    cdef cppclass Analysis_MeltCurve "Analysis_MeltCurve":
        Analysis_MeltCurve() : mcurve_(0 ), cut_(0.0)
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
