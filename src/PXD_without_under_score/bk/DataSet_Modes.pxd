# distutils: language = c++
from libcpp.vector cimport vector
from DataSet_MatrixDbl cimport *
from Frame cimport *
from Analysis cimport *


cdef extern from "DataSet_Modes.h": 
    cdef cppclass DataSet_Modes "DataSet_Modes":
        DataSet_Modes() 
        #~DataSet_Modes() 
        DataSet * Alloc() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        void Add(size_t, const void *)
        AvgIt AvgBegin() const 
        const Darray& AvgCrd() const 
        const Darray& Mass() const 
        int NavgCrd() const 
        double * AvgFramePtr() 
        const double * AvgFramePtr() const 
        void AllocateAvgCoords(int n)
        void SetAvgCoords(const DataSet_2D&)
        int SetModes(bint, int, int, const double *, const double *)
        int CalcEigen(const DataSet_2D&, int)
        void PrintModes() 
        int EigvalToFreq(double)
        int MassWtEigvect(DataSet_const Darray&)
        int ReduceVectors() 
        int Thermo(CpptrajFile&, int, double, double) const 
        void SetType(DataSet_2MatrixType typeIn)
        double Eigenvalue(int i) const 
        const double * Eigenvectors() const 
        const double * Eigenvector(int i) const 
        int Nmodes() const 
        int VectorSize() const 
        DataSet_2MatrixType Type() const 
        bint IsReduced() const 
