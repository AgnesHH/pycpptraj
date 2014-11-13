# distutils: language = c++
from DataSet_1D cimport *
from Vec3 cimport *
from ComplexArray cimport *


cdef extern from "DataSet_Vector.h": 
    cdef cppclass _DataSet_Vector "DataSet_Vector":
        _DataSet_Vector ()
        _DataSet * Alloc ()
        size_t Size ()const 
        int Sync ()
        void Info ()const 
        int Allocate1D(size_t)
        inline void Add(size_t, const void *)
        double Dval(size_t)const 
        double Xcrd(size_t idx)const 
        void WriteBuffer(_CpptrajFile &, size_t)const 
        void SetIred ()
        bint IsIred ()const 
        void reset ()
        void Resize(size_t s)
        void Resize(size_t s, _Vec3 const & v)
        bint Empty ()const 
        const _Vec3 & operator [ ](int i)const 
        _Vec3 & operator [ ](int i)
        const _Vec3 & OXYZ(int i)const 
        void ReserveVecs(size_t n)
        void AddVxyz(_Vec3 const & v)
        void AddVxyz(_Vec3 const & v, _Vec3 const & c)
        const_iterator begin ()const 
        const_iterator end ()const 
        const _Vec3 & Back ()const 
        int CalcSphericalHarmonics(int)
        const _ComplexArray& SphericalHarmonics(int)const 
        double SphericalHarmonicsNorm(int)
