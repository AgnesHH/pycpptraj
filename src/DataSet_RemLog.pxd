# distutils: language = c++
from libcpp.map cimport map
from DataSet cimport *


cdef extern from "DataSet_RemLog.h": 
    ctypedef map[double, int] TmapType
    cdef cppclass _ReplicaFrame "DataSet_RemLog::ReplicaFrame":
        _Replica_Frame() 
        int SetTremd_Frame(const char *, const TmapType&)
        int SetHremd_Frame(const char *, const vector[int]&)
        int ReplicaIdx() const 
        int PartnerIdx() const 
        int CoordsIdx() const 
        bint Success() const 
        double Temp0() const 
        double PE_X1() const 
        double PE_X2() const 
    cdef cppclass _DataSet_RemLog "DataSet_RemLog":
        _DataSet_RemLog() 
        _DataSet * Alloc() 
        void AllocateReplicas(int)
        void AddRep_Frame(int rep, const _ReplicaFrame& frm)
        const _ReplicaFrame& Rep_Frame(int exch, int rep) const 
        int NumExchange() const 
        bint ValidEnsemble() const 
        void TrimLastExchange() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        void Add(size_t, const void *)
