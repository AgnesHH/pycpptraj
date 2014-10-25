# distutil: language = c++

cdef extern from "Vec3.h":
    cdef cppclass Vec3:
        Vec3()
        Vec3(Vec3& rhs)
        Vec3(double, double, double)
        Vec3(double)
        #why not using template?
        Vec3(double*)
        Vec3(float*)
        Vec3(int*)
        #Vec3& operator=(const Vec3& rhs)
        #add more Vec3 operator below
        #end
        double Magnitude2()
        void Zero()
        bint IsZero()
        void Neg()
        void SetVec(double, double, double)
        double Normalize()
        void Print(char*)
        double Angle(Vec3 & )
        double SignedAngle(Vec3&, Vec3&)

        double* Dptr()

