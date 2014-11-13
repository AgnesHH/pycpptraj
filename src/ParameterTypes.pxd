# distutils: language = c++


cdef extern from "ParameterTypes.h": 
    cdef cppclass _AngleType "AngleType":
        _AngleType() : a1_(0 ), a2_(0 ), a3_(0 ), idx_(0)
        _AngleType(int a1, int a2, int a3, int idx): a1_(a1 ), a2_(a2 ), a3_(a3 ), idx_(idx)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int Idx() const 
