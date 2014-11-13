# distutils: language = c++
from DataSet_MatrixDbl cimport *
from Frame cimport *
from Analysis cimport *


cdef extern from "DataSet_Modes.h": 
    cdef cppclass _DataSet_Modes "DataSet_Modes":
        _DataSet_Modes() 
        #~_DataSet_Modes() 
        _DataSet * Alloc() 
        size_t Size() const 
        int Sync() 
        void Info() const 
        void Add(size_t, const void *)
        AvgIt AvgBegin() const 
        const Darray& AvgCrd() const 
        const Darray& Mass() const 
        int NavgCrd() const 
        double * Avg_FramePtr() 
        const double * Avg_FramePtr() const 
        void AllocateAvgCoords(int n)
        void SetAvgCoords(_DataSet_2const D&)
        int SetModes(bint, int, int, const double *, const double *)
        int CalcEigen(_DataSet_2const D&, int)
        void PrintModes() 
        int EigvalToFreq(double)
        int MassWtEigvect(_DataSet_MatrixDbl::const Darray&)
        int ReduceVectors() 
        int Thermo(_CpptrajFile &, int, double, double)const 
        void SetType(_DataSet_2D::MatrixType typeIn)
        double Eigenvalue(int i)const 
        const double * Eigenvectors() const 
        const double * Eigenvector(int i)const 
        int Nmodes() const 
        int VectorSize() const 
        _DataSet_2D::MatrixType Type() const 
        bint IsReduced() const 
