# distutils: language = c++
from DataSet cimport *


cdef extern from "DataSet_RemLog.h": 
    cdef cppclass _DataSet_RemLog "DataSet_RemLog":
        _DataSet_RemLog() 
        _DataSet * Alloc() 
        void AllocateReplicas(int)
        void AddRep_Frame(int rep, const Replica_Frame& frm)
        const Replica_Frame& Rep_Frame(int exch, int rep)const 
        int NumExchange() const 
        bint ValidEnsemble() const 
        void TrimLastExchange() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        void Add(size_t, const void *)
