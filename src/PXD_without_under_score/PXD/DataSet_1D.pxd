# distutils: language = c++
from DataSet cimport *
from CpptrajFile cimport *


cdef extern from "DataSet_1D.h": 
    cdef cppclass DataSet_1D "DataSet_1D":
        DataSet_1D() 
        DataSet_1D(DataType tIn, int wIn, int pIn): DataSet(tIn, wIn, pIn, 1)
        inline bint IsTorsionArray() const 
        double Avg() const 
        double Avg(double& sd) const 
        double Min() const 
        double Max() const 
        int CrossCorr(const DataSet_1D&, DataSet_1D&, int, bint, bint) const 
        double CorrCoeff(const DataSet_1D&) const 
