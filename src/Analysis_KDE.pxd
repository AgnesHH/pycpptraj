# distutils: language = c++
from Analysis cimport *
from DataSet_1D cimport *


cdef extern from "Analysis_KDE.h": 
    cdef cppclass _Analysis_KDE "Analysis_KDE":
        _Analysis_KDE() 
        _DispatchObject * Alloc() 
        void Help() 
        RetType Setup(_DataSet_1D *, const string&, const string&, bint, double, bint, double, double, int, double, _DataSetList &, _DataFileList &)
        RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        RetType Analyze() 
