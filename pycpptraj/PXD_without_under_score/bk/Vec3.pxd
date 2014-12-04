# distutils: language = c++
from libcpp.vector cimport vector


cdef extern from "Vec3.h": 
    cdef cppclass Vec3 "Vec3":
        Vec3() 
        Vec3(const Vec3& rhs)
        Vec3(double vx, double vy, double vz)
        Vec3(double vxyz)
        Vec3(const double * XYZ)
        Vec3(const float * XYZ)
        Vec3(const int * XYZ)
        #Vec3& operator =(const Vec3& rhs)
        void Assign(const double * XYZ)
        #void operator /=(double xIn)
        Vec3 operator /(double xIn) const 
        #void operator *=(double xIn)
        Vec3 operator *(double xIn) const 
        #void operator +=(double xIn)
        Vec3 operator +(double xIn) const 
        #void operator -=(const Vec3& rhs)
        Vec3 operator -(const Vec3& rhs) const 
        #void operator + =(const Vec3& rhs)
        Vec3 operator +(const Vec3& rhs) const 
        double operator *(const Vec3& rhs) const 
        Vec3 Cross(const Vec3& rhs) const 
        double operator[](int idx) const 
        double& operator[](int idx)
        double Magnitude2() const 
        void Zero() 
        bint IsZero() const 
        void Neg() 
        void SetVec(double vx, double vy, double vz)
        double Normalize() 
        void Print(const char *) const 
        double Angle(const Vec3&) const 
        double SignedAngle(const Vec3&, const Vec3&) const 
        const double * Dptr() const 
        double * Dptr() 
