# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Analysis cimport *
from DataSet_Vector cimport *
from Corr cimport *


cdef extern from "Analysis_Timecorr.h": 
    cdef cppclass Analysis_Timecorr::DStoken "Analysis_Timecorr::DStoken":
    cdef cppclass Analysis_Timecorr "Analysis_Timecorr":
        Analysis_Timecorr() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
    cdef cppclass Analysis_Timecorr::AvgResults "Analysis_Timecorr::AvgResults":
