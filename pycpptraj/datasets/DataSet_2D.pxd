# distutils: language = c++
from pycpptraj.datasets.DataSet cimport _DataSet, DataSet, DataType
from pycpptraj.CpptrajFile cimport _CpptrajFile, CpptrajFile


cdef extern from "DataSet_2D.h": 
    # DataSet_2D.h
    ctypedef enum MatrixType "DataSet_2D::MatrixType":
        NO_OP "DataSet_2D::NO_OP"
        DIST "DataSet_2D::DIST"
        COVAR "DataSet_2D::COVAR"
        MWCOVAR "DataSet_2D::MWCOVAR"
        CORREL "DataSet_2D::CORREL"
        DISTCOVAR "DataSet_2D::DISTCOVAR"
        IDEA "DataSet_2D::IDEA"
        IRED "DataSet_2D::IRED"
        DIHCOVAR "DataSet_2D::DIHCOVAR"
        NMAT "DataSet_2D::NMAT"
    # DataSet_2D.h
    ctypedef enum MatrixKind "DataSet_2D::MatrixKind":
        FULL "DataSet_2D::FULL"
        HALF "DataSet_2D::HALF"
        TRI "DataSet_2D::TRI"
    cdef cppclass _DataSet_2D "DataSet_2D" (_DataSet):
        _DataSet_2D() 
        _DataSet_2D(DataType tIn, int wIn, int pIn)
        # virtual methods
        int Allocate2D(size_t, size_t) 
        int AllocateHalf(size_t) 
        int AllocateTriangle(size_t) 
        void Write2D(_CpptrajFile&, int, int) const  
        double GetElement(size_t, size_t) const  
        size_t Nrows() const  
        size_t Ncols() const  
        double * MatrixArray() const  
        MatrixKind Kind() const  
        MatrixType m2dType "Type"() const  
        # end virtual methods

        void Add(size_t, const void *)
        const char * MatrixTypeString(MatrixType m)
        const char * MatrixOutputString(MatrixType m)

cdef class DataSet_2D (DataSet):
    cdef _DataSet_2D* baseptr_1

