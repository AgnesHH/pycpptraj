# distutils: language = c++
from Analysis cimport *
from DataSet_1D cimport *
from TrajectoryFile cimport *


cdef extern from "Analysis_Hist.h": 
    cdef cppclass _Analysis_Hist "Analysis_Hist":
        _Analysis_Hist() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_DataSet_1D *, const string&, const string&, bint, double, bint, double, double, int, double, NormMode, _DataSetList &, _DataFileList &)
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
