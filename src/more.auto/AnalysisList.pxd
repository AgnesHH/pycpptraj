# distutils: language = c++
from Analysis cimport *


cdef extern from "AnalysisList.h": 
    cdef cpplass _AnalysisList "AnalysisList":
        _AnalysisList() 
        #~_AnalysisList() 
        void Clear() 
        void SetDebug(int)
        int Debug() const 
        int Add_Analysis(_DispatchObject::DispatchAllocatorType, _ArgList &, _TopologyList *, _DataSetList *, _DataFileList *)
        int DoAnalyses() 
        void List() const 
        bint Empty() const 
