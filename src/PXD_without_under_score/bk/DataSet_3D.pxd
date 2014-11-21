# distutils: language = c++
from DataSet cimport *
from CpptrajFile cimport *
from Vec3 cimport *


cdef extern from "DataSet_3D.h": 
    cdef cppclass DataSet_3D "DataSet_3D":
        DataSet_3D() 
        DataSet_3D(DataType tIn, int wIn, int pIn): DataSet(tIn, wIn, pIn, 3)
        void Add(size_t, const void *)
        int Allocate_N_O_D(size_t, size_t, size_t, const Vec3&, const Vec3&)
        int Allocate_N_C_D(size_t, size_t, size_t, const Vec3&, const Vec3&)
        int Allocate_X_C_D(const Vec3&, const Vec3&, const Vec3&)
        inline bint CalcBins(double, double, double, int&, int&, int&) const 
        inline double DX() const 
        inline double DY() const 
        inline double DZ() const 
        inline double OX() const 
        inline double OY() const 
        inline double OZ() const 
        inline double MX() const 
        inline double MY() const 
        inline double MZ() const 
        inline Vec3 BinCorner(int, int, int)
        inline Vec3 BinCenter(int, int, int)
