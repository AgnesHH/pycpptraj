# distutil: language = c++
from Vec3 cimport *

cdef extern from "Matrix_3x3.h":
    cdef cppclass Matrix_3x3:
        Matrix_3x3()
        Matrix_3x3(Matrix_3x3&)
        Matrix_3x3(double*)
        Matrix_3x3(double)
        Matrix_3x3(double, double, double)
        #Matrix_3x3& operator=(const Matrix_3x3&)

        #double  operator[](int idx) const { return M_[idx];  }
        #double& operator[](int idx)       { return M_[idx];  }
        Vec3 Row1()
        Vec3 Row2()
        Vec3 Row3()
        Vec3 Col1()
        Vec3 Col2()
        Vec3 Col3()
        void Zero()
        void Print(char*)

        int Diagonalize(Vec3&)
        int Diagonalize_Sort(Vec3&)
        int Diagonalize_Sort_Chirality(Vec3&, int)

        void Transpose()
        #Matrix_3x3& operator*=(const Matrix_3x3&)
        void RotationAroundZ(double, double)
        void RotationAroundY(double, double)
        void CalcRotationMatrix(Vec3&, double)
        void CalcRotationMatrix(double, double, double)
        double RotationAngle()
        Vec3 AxisOfRotation(double)
        #Vec3 operator*(Vec3 const& rhs)
        Vec3 TransposeMult(Vec3& rhs)
        #Matrix_3x3 operator*(Matrix_3x3 const&) const
        Matrix_3x3 TransposeMult(Matrix_3x3&)
        double* Dptr()
