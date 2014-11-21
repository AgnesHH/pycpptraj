# distutils: language = c++
from libcpp.vector cimport vector
from Vec3 cimport *


cdef extern from "Matrix_3x3.h": 
    cdef cppclass Matrix_3x3 "Matrix_3x3":
        Matrix_3x3() 
        Matrix_3x3(const Matrix_3x3&)
        Matrix_3x3(const double *)
        Matrix_3x3(double)
        Matrix_3x3(double, double, double)
        #Matrix_3x3& operator =(const Matrix_3x3&)
        double operator[](int idx) const 
        double& operator[](int idx)
        Vec3 Row1() 
        Vec3 Row2() 
        Vec3 Row3() 
        Vec3 Col1() 
        Vec3 Col2() 
        Vec3 Col3() 
        void Zero() 
        void Print(const char *) const 
        int Diagonalize(Vec3&)
        int Diagonalize_Sort(Vec3&)
        int Diagonalize_Sort_Chirality(Vec3&, int)
        void Transpose() 
        #Matrix_3x3& operator *=(const Matrix_3x3&)
        void RotationAroundZ(double, double)
        void RotationAroundY(double, double)
        void CalcRotationMatrix(const Vec3&, double)
        void CalcRotationMatrix(double, double, double)
        double RotationAngle() 
        Vec3 AxisOfRotation(double)
        Vec3 operator *(const Vec3& rhs) const 
        Vec3 TransposeMult(const Vec3& rhs) const 
        Matrix_3x3 operator *(const Matrix_3x3&) const 
        Matrix_3x3 TransposeMult(const Matrix_3x3&) const 
        const double * Dptr() const 
        double * Dptr() 
