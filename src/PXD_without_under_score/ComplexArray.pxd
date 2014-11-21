# distutils: language = c++
from libcpp.vector cimport vector
from ArrayIterator cimport *


cdef extern from "ComplexArray.h": 
    cdef cppclass ComplexArray "ComplexArray":
        ComplexArray() : data_(0 ), ndata_(0 ), ncomplex_(0)
        ComplexArray(int)
        ComplexArray(const ComplexArray&)
        #ComplexArray& operator =(const ComplexArray&)
        #~ComplexArray() 
        void Allocate(int)
        void Assign(const ComplexArray&)
        void PadWithZero(int)
        void Normalize(double)
        void SquareModulus() 
        void ComplexConjTimes(const ComplexArray&)
        double * CAptr() 
        int size() const 
        double& operator[](int idx)
        const double& operator[](int idx) const 
        const iterator begin() const 
        const iterator end() const 
