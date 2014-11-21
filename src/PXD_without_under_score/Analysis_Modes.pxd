# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Analysis cimport *
from DataSet_Modes cimport *
from Trajout cimport *


cdef extern from "Analysis_Modes.h": 
    cdef cppclass Analysis_Modes "Analysis_Modes":
        Analysis_Modes() 
        DispatchObject * Alloc() 
        void Help() 
        #~Analysis_Modes() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
