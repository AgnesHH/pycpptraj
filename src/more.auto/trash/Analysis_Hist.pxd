# distutils: language = c++
from Analysis cimport *
from DataSet_1D cimport *
from TrajectoryFile cimport *


cdef extern from "Analysis_Hist.h": 
    cdef cpplass _Analysis_Hist "Analysis_Hist":
        _Analysis_Hist() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_DataSet_1D *, const string&, const string&, bint, double, bint, double, double, int, double, NormMode, _DataSetList &, _DataFileList &)
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
