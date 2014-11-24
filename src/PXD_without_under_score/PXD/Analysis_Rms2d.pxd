# distutils: language = c++
from Analysis cimport *
from DataSet_Coords cimport *
from DataSet_MatrixFlt cimport *
from SymmetricRmsdCalc cimport *


cdef extern from "Analysis_Rms2d.h": 
    cdef cppclass Analysis_Rms2d "Analysis_Rms2d":
        Analysis_Rms2d() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
