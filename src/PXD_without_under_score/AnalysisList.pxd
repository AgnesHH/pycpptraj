# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Analysis cimport *


cdef extern from "AnalysisList.h": 
    cdef cppclass AnalysisList "AnalysisList":
        AnalysisList() 
        #~AnalysisList() 
        void Clear() 
        void SetDebug(int)
        int Debug() const 
        int AddAnalysis(DispatchAllocatorType, ArgList&, TopologyList *, DataSetList *, DataFileList *)
        int DoAnalyses() 
        void List() const 
        bint Empty() const 
