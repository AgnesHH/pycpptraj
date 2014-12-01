# distutils: language = c++
from Analysis cimport *
from DataSet_2D cimport *
from DataSet_Modes cimport *


cdef extern from "Analysis_Matrix.h": 
    cdef cppclass _Analysis_Matrix "Analysis_Matrix":
        _Analysis_Matrix() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList&, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
