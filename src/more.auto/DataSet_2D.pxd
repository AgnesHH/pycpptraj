# distutils: language = c++
from DataSet cimport *
from CpptrajFile cimport *


cdef extern from "DataSet_2D.h": 
    cdef cpplass _DataSet_2D "DataSet_2D":
        _DataSet_2D() 
        _DataSet_2D(DataSet::DataType tIn, int wIn, int pIn): DataSet(tIn, wIn, pIn, 2)
        void Add(size_t, const void *)
        static const char * MatrixTypeString(MatrixType m)
        static const char * MatrixOutputString(MatrixType m)
