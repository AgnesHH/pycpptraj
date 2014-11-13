# distutils: language = c++
from DataSet_Coords cimport *
from Trajin cimport *


cdef extern from "DataSet_Coords_TRJ.h": 
    cdef cppclass _DataSet_Coords_TRJ "DataSet_Coords_TRJ":
        _DataSet_Coords_TRJ() 
        #~_DataSet_Coords_TRJ() 
        static _DataSet * Alloc() 
        int AddSingle_Trajin(const string&, _ArgList &, _Topology *)
        int AddInputTraj(_Trajin *)
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t)const 
        double Xcrd(size_t idx)const 
        void WriteBuffer(_CpptrajFile &, size_t)const 
        void Add_Frame(const _Frame& fIn)
        void SetCRD(int idx, const _Frame& fIn)
        void Get_Frame(int idx, _Frame & fIn)
        void Get_Frame(int idx, _Frame & fIn, const _AtomMask& mIn)
