# distutils: language = c++
#from .Analysis.Analysis cimport *
from .analysis.Analysis cimport *


cdef extern from "AnalysisList.h": 
    cdef cppclass _AnalysisList "AnalysisList":
        _AnalysisList() 
        #~_AnalysisList() 
        void Clear() 
        void SetDebug(int)
        int Debug() const 
        int Add_Analysis(DispatchAllocatorType, _ArgList &, _TopologyList *, _DataSetList *, _DataFileList *)
        int DoAnalyses() 
        void List() const 
        bint Empty() const 

cdef class AnalysisList:
    cdef _AnalysisList* thisptr
