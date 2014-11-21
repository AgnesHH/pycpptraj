# distutils: language = c++
from libcpp.string cimport string
from Analysis cimport *
from DataSet_1D cimport *


cdef extern from "Analysis_CrankShaft.h": 
    cdef cppclass Analysis_CrankShaft "Analysis_CrankShaft":
        Analysis_CrankShaft() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
