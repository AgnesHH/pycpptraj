# distutils: language = c++
from libcpp.vector cimport vector
from DataSet_1D cimport *
from Vec3 cimport *
from ComplexArray cimport *


cdef extern from "DataSet_Vector.h": 
    cdef cppclass DataSet_Vector "DataSet_Vector":
        DataSet_Vector() 
        DataSet * Alloc() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        inline void Add(size_t, const void *)
        double Dval(size_t) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(CpptrajFile&, size_t) const 
        void SetIred() 
        bint IsIred() const 
        void reset() 
        void Resize(size_t s)
        void Resize(size_t s, const Vec3& v)
        bint Empty() const 
        const Vec3& operator[](int i) const 
        Vec3& operator[](int i)
        const Vec3& OXYZ(int i) const 
        void ReserveVecs(size_t n)
        void AddVxyz(const Vec3& v)
        void AddVxyz(const Vec3& v, const Vec3& c)
        #const_iterator begin() const 
        #const_iterator end() const 
        const Vec3& Back() const 
        int CalcSphericalHarmonics(int)
        const ComplexArray& SphericalHarmonics(int) const 
        double SphericalHarmonicsNorm(int)
