# distutils: language = c++
from DataSet_3D cimport *
from Grid cimport *


cdef extern from "DataSet_GridFlt.h": 
    cdef cppclass _DataSet_GridFlt "DataSet_GridFlt":
        _DataSet_GridFlt() : _DataSet_3D(GRID_FLT, 12, 4)
        float & operator [ ](size_t idx)
        static _DataSet * Alloc() 
        Grid [float] const & InternalGrid() const 
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate3D(size_t x, size_t y, size_t z)
        void Write3D(_CpptrajFile &, int, int, int)const 
        double GetElement(int x, int y, int z)const 
        void SetElement(int x, int y, int z, float v)
        double operator [ ](size_t idx)const 
        size_t NX() const 
        size_t NY() const 
        size_t NZ() const 
        iterator begin() 
        iterator end() 
        inline long int Increment(_Vec3 const &, float)
        inline long int Increment(const double *, float)
        inline long int Increment(int, int, int, float)
        float GridVal(int x, int y, int z)const 
        long int CalcIndex(int i, int j, int k)const 