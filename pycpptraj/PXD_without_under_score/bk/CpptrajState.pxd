# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from TrajinList cimport *
from TrajoutList cimport *
from FrameList cimport *
from TopologyList cimport *
from DataSetList cimport *
from DataFileList cimport *
from ActionList cimport *
from AnalysisList cimport *


cdef extern from "CpptrajState.h": 
    cdef cppclass CpptrajState "CpptrajState":
        CpptrajState() : debug_(0 ), showProgress_(true ), exitOnError_(true)
        TopologyList * PFL() 
        FrameList * FL() 
        DataSetList * DSL() 
        DataFileList * DFL() 
        void SetNoExitOnError() 
        void SetNoProgress() 
        int Debug() const 
        bint ExitOnError() const 
        bint EmptyState() const 
        int AddTrajin(ArgList&, bint)
        int AddTrajin(const string&)
        int RunAnalyses() 
        const TrajinList& InputTrajList() const 
        inline int AddTrajout(const ArgList&)
        inline int AddTrajout(const string&)
        inline int AddReference(ArgList&)
        inline int AddReference(const string&)
        inline int AddAction(DispatchAllocatorType, ArgList&)
        inline int AddAnalysis(DispatchAllocatorType, ArgList&)
        int WorldSize() 
        int ListAll(ArgList&) const 
        int SetListDebug(ArgList&)
        int ClearList(ArgList&)
        int RemoveDataSet(ArgList&)
        int TrajLength(const string&, const vector[string]&)
        int Run() 
        void MasterDataFileWrite() 
