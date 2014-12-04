# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from DataSet_1D cimport *


cdef extern from "DataSet_string.h": 
    cdef cppclass DataSet_string "DataSet_string":
        DataSet_string() : DataSet_1D(STRING, 1, 0)
        DataSet * Alloc() 
        string& operator[](size_t idx)
        void AddElement(const string& s)
        void Resize(size_t sizeIn)
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t idx) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(CpptrajFile&, size_t) const 
