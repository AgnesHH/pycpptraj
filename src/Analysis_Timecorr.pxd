# distutils: language = c++
from Analysis cimport *
from DataSet_Vector cimport *
from Corr cimport *


cdef extern from "Analysis_Timecorr.h": 
    cdef cppclass _Analysis_Timecorr "Analysis_Timecorr":
        _Analysis_Timecorr() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_ArgList&, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
