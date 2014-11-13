# distutils: language = c++
from Analysis cimport *
from DataSet_Vector cimport *


cdef extern from "Analysis_VectorMath.h": 
    cdef cppclass _Analysis_VectorMath "Analysis_VectorMath":
        _Analysis_VectorMath() 
        _DispatchObject * Alloc() 
        void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
