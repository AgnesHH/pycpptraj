# distutils: language = c++
from libcpp.vector cimport vector


cdef extern from "ReplicaDimArray.h": 
    # ReplicaDimArray.h
    ctypedef enum RemDimType "ReplicaDimArray::RemDimType":
        UNKNOWN "ReplicaDimArray::UNKNOWN"
        TEMPERATURE "ReplicaDimArray::TEMPERATURE"
        PARTIAL "ReplicaDimArray::PARTIAL"
        HAMILTONIAN "ReplicaDimArray::HAMILTONIAN"
        PH "ReplicaDimArray::PH"
    cdef cppclass ReplicaDimArray "ReplicaDimArray":
        ReplicaDimArray() 
        int operator[](int idx) const 
        void AddRemdDimension(int d)
        void clear() 
        int Ndims() const 
        const char * Description(int idx) const 
        bint operator ! =(const ReplicaDimArray& rhs) const 
