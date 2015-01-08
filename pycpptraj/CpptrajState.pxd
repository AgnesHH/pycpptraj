# distutils: language = c++
from libcpp.string cimport string
from DispatchObject cimport DispatchAllocatorType
from libcpp.vector cimport vector
from TrajinList cimport _TrajinList, TrajinList
#from TrajoutList cimport _TrajoutList, TrajoutList
from ArgList cimport _ArgList, ArgList
from FrameList cimport _FrameList, FrameList
from TopologyList cimport _TopologyList, TopologyList
from DataSetList cimport _DataSetList, DataSetList
from DataFileList cimport _DataFileList, DataFileList
from ActionList cimport _ActionList, ActionList
from AnalysisList cimport _AnalysisList, AnalysisList
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
        void SetActionSilence(bint b)
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
    cdef public TopologyList toplist
    cdef public DataFileList datafilelist
    cdef public DataSetList datasetlist
    cdef public FrameList framelist
