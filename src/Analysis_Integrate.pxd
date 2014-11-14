# distutil: language = c++

from Analysis cimport *
from Array1D cimport *
from DataSetList cimport *
from DataFileList cimport *
from DataSet_Mesh cimport *
from TopologyList cimport *

cdef extern from "Analysis_Integrate.h":
    cdef cppclass _Analysis_Integrate "Analysis_Integrate":
        _Analysis_Integrate()
        _DispatchObject* Alloc()
        void Help()
        RetType Setup(_ArgList&,_DataSetList*,_TopologyList*,_DataFileList*,
                               int)
        RetType Analyze()

#cdef class Analysis_Integrate:
#    cdef _Analysis_Integrate* thiptr
