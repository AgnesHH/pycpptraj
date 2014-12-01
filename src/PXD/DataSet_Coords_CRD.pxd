# distutils: language = c++
from DataSet_Coords cimport *


cdef extern from "DataSet_Coords_CRD.h": 
    cdef cppclass _DataSet_Coords_CRD "DataSet_Coords_CRD":
        _DataSet_Coords_CRD() : DataSet_Coords(COORDS)
        _DataSet * Alloc() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t)const 
        double Xcrd(size_t idx)const 
        void WriteBuffer(_CpptrajFile &, size_t)const 
        inline void Add_Frame(const _Frame& fIn)
        inline void Get_Frame(int idx, _Frame & fIn)
        inline void Get_Frame(int idx, _Frame & fIn, const _AtomMask& mIn)
        inline void SetCRD(int idx, const _Frame& fIn)
