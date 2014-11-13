# distutils: language = c++
from Analysis cimport *
from Array1D cimport *
from DataSet_Mesh cimport *


cdef extern from "Analysis_Spline.h": 
    cdef cpplass _Analysis_Spline "Analysis_Spline":
        _Analysis_Spline() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
