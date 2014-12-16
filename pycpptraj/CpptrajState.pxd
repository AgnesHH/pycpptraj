# distutils: language = c++
from libcpp.vector cimport vector
from TrajinList cimport *
from TrajoutList cimport *
from ArgList cimport *
from FrameList cimport *
from TopologyList cimport *
from DataSetList cimport *
from DataFileList cimport *
from ActionList cimport *
from AnalysisList cimport *
from _FunctPtr cimport FunctPtr


cdef extern from "CpptrajState.h": 
    cdef cppclass _CpptrajState "CpptrajState":
        _CpptrajState()
        _TopologyList * PFL()
        _FrameList * FL()
        _DataSetList * DSL()
        _DataFileList * DFL()
        void SetNoExitOnError()
        void SetNoProgress()
        int Debug()const 
        bint ExitOnError()const 
        bint EmptyState()const 
        int AddTrajin(_ArgList &, bint)
        int AddTrajin(const string&)
        int RunAnalyses()
        const _TrajinList& InputTrajList()const 
        inline int AddTrajout(const _ArgList&)
        inline int AddTrajout(const string&)
        inline int AddReference(_ArgList &)
        inline int AddReference(const string&)
        inline int AddAction(DispatchAllocatorType, _ArgList &)
        inline int AddAnalysis(DispatchAllocatorType, _ArgList &)
        int WorldSize()
        int ListAll(_ArgList &)const 
        int SetListDebug(_ArgList &)
        int ClearList(_ArgList &)
        int RemoveDataSet(_ArgList &)
        int TrajLength(const string&, const vector[string]&)
        int Run()
        void MasterDataFileWrite()

cdef class CpptrajState:
    cdef _CpptrajState* thisptr

