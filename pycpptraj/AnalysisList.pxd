# distutils: language = c++
from pycpptraj.DispatchObject  cimport DispatchAllocatorType
from pycpptraj.analyses.Analysis cimport _Analysis, Analysis
from pycpptraj.ArgList cimport _ArgList 
from pycpptraj.TopologyList cimport _TopologyList
from pycpptraj.DataSetList cimport _DataSetList
from pycpptraj.DataFileList cimport _DataFileList


cdef extern from "AnalysisList.h": 
    cdef cppclass _AnalysisList "AnalysisList":
        _AnalysisList() 
        #~_AnalysisList() 
        void Clear() 
        void SetDebug(int)
        int Debug() const 
        int AddAnalysis(DispatchAllocatorType, _ArgList &, _TopologyList *, _DataSetList *, _DataFileList *)
        int DoAnalyses() 
        void List() const 
        bint Empty() const 

cdef class AnalysisList:
    cdef _AnalysisList* thisptr
