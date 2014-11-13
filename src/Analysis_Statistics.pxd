# distutils: language = c++
from Analysis cimport *
from Array1D cimport *
from DataSet_integer cimport *
from DataSet_float cimport *
from DataSet_string cimport *


cdef extern from "Analysis_Statistics.h": 
    cdef cppclass _Analysis_Statistics "Analysis_Statistics":
        _Analysis_Statistics() 
        _DispatchObject * Alloc() 
        void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
