# distutils: language = c++
from DataSet cimport *
from CpptrajFile cimport *


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
    cdef cppclass _DataSet_2D "DataSet_2D":
        _DataSet_2D() 
        _DataSet_2D(DataType tIn, int wIn, int pIn)
        void Add(size_t, const void *)
        const char * MatrixTypeString(MatrixType m)
        const char * MatrixOutputString(MatrixType m)
