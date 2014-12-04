# distutils: language = c++
from libcpp.vector cimport vector
from DataSet_Coords cimport *


cdef extern from "DataSet_Coords_CRD.h": 
    cdef cppclass DataSet_Coords_CRD "DataSet_Coords_CRD":
        DataSet_Coords_CRD() : DataSet_Coords(COORDS)
        DataSet * Alloc() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(CpptrajFile&, size_t) const 
        inline void AddFrame(const Frame& fIn)
        inline void GetFrame(int idx, Frame& fIn)
        inline void GetFrame(int idx, Frame& fIn, const AtomMask& mIn)
        inline void SetCRD(int idx, const Frame& fIn)
