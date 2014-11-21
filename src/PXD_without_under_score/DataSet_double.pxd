# distutils: language = c++
from libcpp.vector cimport vector
from DataSet_1D cimport *


cdef extern from "DataSet_double.h": 
    cdef cppclass DataSet_double "DataSet_double":
        DataSet_double() : DataSet_1D(DOUBLE, 12, 4 ), bound_(0.0 ), boundh_(0.0 ), rexp_(-1.0)
        DataSet * Alloc() 
        double& operator[](size_t idx)
        double operator[](size_t idx) const 
        #void operator =(const vector[double]& rhs)
        void AddElement(double d)
        void Resize(size_t sizeIn)
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t idx) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(CpptrajFile&, size_t) const 
        #iterator begin() 
        #iterator end() 
        void SetNOE(double b, double bh, double r)
        double NOE_bound() const 
        double NOE_boundH() const 
        double NOE_rexp() const 
        void ShiftTorsions(double, double)
