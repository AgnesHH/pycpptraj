# distutils: language = c++
from libcpp.string cimport string
from Analysis cimport *
from Array1D cimport *


cdef extern from "Analysis_Lifetime.h": 
    cdef cppclass Analysis_Lifetime "Analysis_Lifetime":
        Analysis_Lifetime() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(const Array1D&)
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
