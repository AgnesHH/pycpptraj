# distutils: language = c++
from libcpp.string cimport string
from Analysis cimport *
from DataSet_1D cimport *


cdef extern from "Analysis_KDE.h": 
    cdef cppclass Analysis_KDE "Analysis_KDE":
        Analysis_KDE() 
        DispatchObject * Alloc() 
        void Help() 
        RetType Setup(DataSet_1D *, const string&, const string&, bint, double, bint, double, double, int, double, DataSetList&, DataFileList&)
        RetType Setup(ArgList&, DataSetList *, TopologyList *, DataFileList *, int)
        RetType Analyze() 
