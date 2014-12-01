# distutils: language = c++
from libcpp.vector cimport vector
from TrajinList cimport *
from TrajoutList cimport *
from FrameList cimport *
from TopologyList cimport *
from DataSetList cimport *
from DataFileList cimport *
from ActionList cimport *
from AnalysisList cimport *


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
        int Add_Trajin(_ArgList &, bint)
        int Add_Trajin(const string&)
        int RunAnalyses()
        const _TrajinList& InputTrajList()const 
        inline int Add_Trajout(const _ArgList&)
        inline int Add_Trajout(const string&)
        inline int AddReference(_ArgList &)
        inline int AddReference(const string&)
        inline int Add_Action(DispatchAllocatorType, _ArgList &)
        inline int Add_Analysis(DispatchAllocatorType, _ArgList &)
        int WorldSize()
        int ListAll(_ArgList &)const 
        int SetListDebug(_ArgList &)
        int ClearList(_ArgList &)
        int Remove_DataSet(_ArgList &)
        int TrajLength(const string&, const vector[string]&)
        int Run()
        void Master_DataFileWrite()

cdef class CpptrajState:
    cdef _CpptrajState* thisptr

