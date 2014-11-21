# distutils: language = c++
from libcpp.vector cimport vector
from DataSet cimport *


cdef extern from "DataSet_RemLog.h": 
    cdef cppclass DataSet_RemLog "DataSet_RemLog":
        DataSet_RemLog() 
        DataSet * Alloc() 
        void AllocateReplicas(int)
        void AddRepFrame(int rep, const ReplicaFrame& frm)
        const ReplicaFrame& RepFrame(int exch, int rep) const 
        int NumExchange() const 
        bint ValidEnsemble() const 
        void TrimLastExchange() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        void Add(size_t, const void *)
    cdef cppclass DataSet_RemLog::ReplicaFrame "DataSet_RemLog::ReplicaFrame":
        ReplicaFrame() : replicaIdx_(- 1 ), partnerIdx_(- 1 ), coordsIdx_(- 1 ), success_(false ), temp0_(0.0 ), PE_x1_(0.0 ), PE_x2_(0.0)
        int SetTremdFrame(const char *, const TmapType&)
        int SetHremdFrame(const char *, const vector[int]&)
        int ReplicaIdx() const 
        int PartnerIdx() const 
        int CoordsIdx() const 
        bint Success() const 
        double Temp0() const 
        double PE_X1() const 
        double PE_X2() const 
