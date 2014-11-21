# distutils: language = c++
from libcpp.vector cimport vector
from DataSet_1D cimport *


cdef extern from "DataSet_Mesh.h": 
    cdef cppclass DataSet_Mesh "DataSet_Mesh":
        DataSet_Mesh() : DataSet_1D(XYMESH, 12, 4)
        DataSet_Mesh(int, double, double)
        DataSet * Alloc() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        int Allocate1D(size_t)
        void Add(size_t, const void *)
        double Dval(size_t idx) const 
        double Xcrd(size_t idx) const 
        void WriteBuffer(CpptrajFile&, size_t) const 
        inline void AddXY(double, double)
        double X(int i) const 
        double Y(int i) const 
        void CalculateMeshX(int, double, double)
        int SetMeshXY(const DataSet_1D&)
        double Integrate_Trapezoid(DataSet_Mesh&) const 
        double Integrate_Trapezoid() const 
        int SetSplinedMeshY(const vector[double]&, const vector[double]&)
        int SetSplinedMesh(const DataSet_1D&)
        int LinearRegression(double&, double&, double&, bint) const 
