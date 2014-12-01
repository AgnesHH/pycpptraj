# distutils: language = c++


cdef extern from "ReplicaDimArray.h": 
    cdef cppclass _ReplicaDimArray "ReplicaDimArray":
        _ReplicaDimArray()
        int operator[](int idx)const 
        void AddRemd_Dimension(int d)
        void clear()
        int Ndims()const 
        const char* Description(int idx)const 
        bint operator !=(const _ReplicaDimArray & rhs)const 
