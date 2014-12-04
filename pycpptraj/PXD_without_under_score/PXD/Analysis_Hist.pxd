# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Analysis cimport *
from DataSet_1D cimport *
from TrajectoryFile cimport *


cdef extern from "Analysis_Hist.h": 
    # Analysis_Hist.h
    ctypedef enum NormMode "Analysis_Hist::NormMode":
        NO_NORM "Analysis_Hist::NO_NORM"
        NORM_SUM "Analysis_Hist::NORM_SUM"
        NORM_INT "Analysis_Hist::NORM_INT"
    cdef cppclass Analysis_Hist "Analysis_Hist":
        Analysis_Hist() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(DataSet_1D *, const string&, const string&, bint, double, bint, double, double, int, double, NormMode, DataSetList&, DataFileList&)
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
