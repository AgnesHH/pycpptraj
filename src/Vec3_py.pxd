# distutil: language = c++

cdef extern from "Vec3.h":
    cdef cppclass _Vec3 "Vec3":
        _Vec3()
        _Vec3(_Vec3& rhs)
        _Vec3(double, double, double)
        _Vec3(double)
        #why not using template?
        _Vec3(double*)
        _Vec3(float*)
        _Vec3(int*)
        #_Vec3& operator=(const _Vec3& rhs)
        #add more _Vec3 operator below
        #end
        double Magnitude2()
        void Zero()
        bint IsZero()
        void Neg()
        void SetVec(double, double, double)
        double Normalize()
        void Print(char*)
        double Angle(_Vec3&)
        double SignedAngle(_Vec3&, _Vec3&)
        double* Dptr()
