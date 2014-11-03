# distutil: language = c++

cdef extern from "DataSet_1D.h":
    cdef cppclass _DataSet_1D "DataSet_1D":
        _DataSet_1D()
        _DataSet_1D(_DataSet_1D.DataType, int, int)
        inline bool IsTorsionArray()
        double Avg()
        double Avg(double&)
        double Min()
        double Max()
        int CrossCorr(const _DataSet_1D, _DataSet_1D, int, bint, bint)
        double CorrCoeff(const _DataSet_1D&)
