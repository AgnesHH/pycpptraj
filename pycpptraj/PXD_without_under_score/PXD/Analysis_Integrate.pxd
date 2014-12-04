# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *
from Array1D cimport *
from DataSet_Mesh cimport *


cdef extern from "Analysis_Integrate.h": 
    cdef cppclass Analysis_Integrate "Analysis_Integrate":
        Analysis_Integrate() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
