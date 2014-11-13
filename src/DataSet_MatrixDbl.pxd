# distutils: language = c++
from DataSet_2D cimport *
from Matrix cimport *


cdef extern from "DataSet_MatrixDbl.h": 
    cdef cppclass _DataSet_MatrixDbl "DataSet_MatrixDbl":
        _DataSet_MatrixDbl (): _DataSet_2D(MATRIX_DBL, 12, 4)
        double & operator [ ](size_t idx)
        _DataSet * Alloc ()
        size_t Size ()const 
        int Sync ()
        void Info ()const 
        int Allocate2D(size_t x, size_t y)
        int AllocateHalf(size_t x)
        int AllocateTriangle(size_t x)
        void Write2D(_CpptrajFile &, int, int)const 
        double GetElement(size_t x, size_t y)const 
        size_t Nrows ()const 
        size_t Ncols ()const 
        double * MatrixArray ()const 
        MatrixKind Kind ()const 
        MatrixType Type ()const 
        double & Element(size_t x, size_t y)
        int AddElement(double d)
        void SetElement(size_t x, size_t y, double d)
        iterator begin ()
        iterator end ()
        const Darray& Vect ()const 
        void AllocateVector(size_t vsize)
        Darray::iterator v1begin ()
        Darray::iterator v1end ()
        void SetTypeAndKind(MatrixType tIn, MatrixKind kIn)
        void StoreMass(const Darray& mIn)
        const Darray& Mass ()const 
