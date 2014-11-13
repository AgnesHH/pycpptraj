# distutils: language = c++
from Analysis cimport *
from DataSet_Coords cimport *


cdef extern from "Analysis_CrdFluct.h": 
    cdef cppclass _Analysis_CrdFluct "Analysis_CrdFluct":
        _Analysis_CrdFluct() 
        static _DispatchObject * Alloc() 
        static void Help() 
        _Analysis::RetType Setup(_ArgList &, _DataSetList *, _TopologyList *, _DataFileList *, int)
        _Analysis::RetType Analyze() 
