# distutils: language = c++
from libcpp.vector cimport vector
from Analysis cimport *
from Array1D cimport *
from DataSet_Mesh cimport *


cdef extern from "Analysis_Spline.h": 
    cdef cppclass Analysis_Spline "Analysis_Spline":
        Analysis_Spline() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
