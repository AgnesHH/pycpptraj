# distutils: language = c++
from Analysis cimport *
from DataSet_Vector cimport *


cdef extern from "Analysis_VectorMath.h": 
    cdef cppclass Analysis_VectorMath "Analysis_VectorMath":
        Analysis_VectorMath() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
