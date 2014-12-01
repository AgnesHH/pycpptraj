# distutils: language = c++
from Analysis cimport *
from DataSet_Modes cimport *
from Trajout cimport *


cdef extern from "Analysis_Modes.h": 
    cdef cppclass _Analysis_Modes "Analysis_Modes":
        _Analysis_Modes() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Analysis_Modes() 
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
