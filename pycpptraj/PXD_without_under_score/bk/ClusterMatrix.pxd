# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Matrix cimport *
from ClusterSieve cimport *


cdef extern from "ClusterMatrix.h": 
    cdef cppclass ClusterMatrix "ClusterMatrix":
        ClusterMatrix() 
        int SetupWithSieve(size_t, size_t, int)
        ClusterMatrix(const ClusterMatrix&)
        #ClusterMatrix& operator =(const ClusterMatrix&)
        int SaveFile(const string&) const 
        int LoadFile(const string&, int)
        int SetupMatrix(size_t)
        void Ignore(int row)
        bint IgnoringRow(int row) const 
        size_t Nframes() const 
        SievedFrames Sieved() const 
        int SieveValue() const 
        double FindMin(int&, int&) const 
        void PrintElements() const 
        inline double GetFdist(int, int) const 
        inline double GetCdist(int c, int r) const 
        inline void SetElement(int, int, double)
        size_t Nelements() const 
        int AddElement(double d)
