# distutils: language = c++
from Analysis cimport *
from DataSet_1D cimport *
from TrajectoryFile cimport *


cdef extern from "Analysis_Hist.h": 
    ctypedef enum NormMode "Analysis_Hist::NormMode":
        NO_NORM "Analysis_Hist::NO_NORM"
        NORM_SUM "Analysis_Hist::NORM_SUM"
        NORM_INT "Analysis_Hist::NORM_INT"
    cdef cppclass _Analysis_Hist "Analysis_Hist":
        _Analysis_Hist() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_DataSet_1D *, const string&, const string&, bint, double, bint, double, double, int, double, NormMode, _DataSetList &, _DataFileList &)
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
