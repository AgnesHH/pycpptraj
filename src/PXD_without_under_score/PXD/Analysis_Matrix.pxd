# distutils: language = c++
from libcpp.string cimport string
from Analysis cimport *
from DataSet_2D cimport *
from DataSet_Modes cimport *


cdef extern from "Analysis_Matrix.h": 
    cdef cppclass Analysis_Matrix "Analysis_Matrix":
        Analysis_Matrix() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
