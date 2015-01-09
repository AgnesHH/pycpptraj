# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
<<<<<<< HEAD
from pycpptraj.DispatchObject cimport DispatchAllocatorType
from libcpp.vector cimport vector
from pycpptraj.TrajinList cimport _TrajinList, TrajinList
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.FrameList cimport _FrameList, FrameList
from pycpptraj.TopologyList cimport _TopologyList, TopologyList
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.DataFileList cimport _DataFileList, DataFileList
from pycpptraj.ActionList cimport _ActionList, ActionList
from pycpptraj.AnalysisList cimport _AnalysisList, AnalysisList
from pycpptraj._FunctPtr cimport FunctPtr
=======
from DispatchObject cimport DispatchAllocatorType
from TrajinList cimport _TrajinList, TrajinList
from ArgList cimport _ArgList, ArgList
from FrameList cimport _FrameList, FrameList
from TopologyList cimport _TopologyList, TopologyList
from DataSetList cimport _DataSetList, DataSetList
from DataFileList cimport _DataFileList, DataFileList
from ActionList cimport _ActionList, ActionList
from AnalysisList cimport _AnalysisList, AnalysisList
from _FunctPtr cimport FunctPtr
>>>>>>> 16e2f007a1dc5c43210fcb3c0fa4392624df8870


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
