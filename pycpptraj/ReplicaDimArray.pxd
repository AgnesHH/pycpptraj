# distutils: language = c++


cdef extern from "ReplicaDimArray.h": 
    cdef cppclass _ReplicaDimArray "ReplicaDimArray":
        _ReplicaDimArray()
        int index_opr "operator[]"(int idx)const 
        void AddRemdDimension(int d)
        void clear()
        int Ndims()const 
        const char* Description(int idx)const 
        bint operator !=(const _ReplicaDimArray & rhs)const 

cdef class ReplicaDimArray:
    cdef _ReplicaDimArray* thisptr
