# distutils: language = c++
from Analysis cimport *
from DataSet_Coords cimport *
from DataSet_MatrixFlt cimport *
from SymmetricRmsdCalc cimport *


cdef extern from "Analysis_Rms2d.h": 
    cdef cppclass _Analysis_Rms2d "Analysis_Rms2d":
        _Analysis_Rms2d() 
        _DispatchObject * Alloc() 
        void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
