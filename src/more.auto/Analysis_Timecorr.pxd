# distutils: language = c++
from Analysis cimport *
from DataSet_Vector cimport *
from Corr cimport *


cdef extern from "Analysis_Timecorr.h": 
    cdef cpplass _Analysis_Timecorr::DStoken "Analysis_Timecorr::DStoken":
