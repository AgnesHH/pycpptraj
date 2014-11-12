# distutils: language = c++
from Analysis cimport *
from DataSet_Coords cimport *
from DataSet_MatrixFlt cimport *
from SymmetricRmsdCalc cimport *


cdef extern from "Analysis_Rms2d.h": 
    cdef cpplass _Analysis_Rms2d "Analysis_Rms2d":
        _Analysis_Rms2d() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
