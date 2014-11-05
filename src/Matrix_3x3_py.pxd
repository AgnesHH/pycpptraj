# distutil: language = c++
from Vec3 cimport *

cdef extern from "Matrix_3x3.h":
    cdef cppclass _Matrix_3x3 "Matrix_3x3":
        _Matrix_3x3()
        _Matrix_3x3(_Matrix_3x3&)
        _Matrix_3x3(double*)
        _Matrix_3x3(double)
        _Matrix_3x3(double, double, double)
        #_Matrix_3x3& operator=(const _Matrix_3x3&)
        const _Matrix_3x3 operator*(const _Matrix_3x3)

        double  operator[](int)
        double& operator[](int)
        _Vec3 Row1()
        _Vec3 Row2()
        _Vec3 Row3()
        _Vec3 Col1()
        _Vec3 Col2()
        _Vec3 Col3()
        void Zero()
        void Print(char*)

        int Diagonalize(_Vec3&)
        int Diagonalize_Sort(_Vec3&)
        int Diagonalize_Sort_Chirality(_Vec3&, int)

        void Transpose()
        #_Matrix_3x3& operator*=(const _Matrix_3x3&)
        void RotationAroundZ(double, double)
        void RotationAroundY(double, double)
        void CalcRotationMatrix(_Vec3&, double)
        void CalcRotationMatrix(double, double, double)
        double RotationAngle()
        _Vec3 AxisOfRotation(double)
        _Vec3 operator*(const _Vec3& rhs)
        _Vec3 TransposeMult(_Vec3& rhs)
        _Matrix_3x3 TransposeMult(_Matrix_3x3&)
        double* Dptr()

cdef class Matrix_3x3:
    cdef _Matrix_3x3* thisptr
    #cdef int MAX_ITERATIONS
