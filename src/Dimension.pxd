# distutil: language = c++

cdef extern from "Dimension.h":
    ctypedef enum DimIdxType "Dimension::DimIdxType"
    cdef cppclass _Dimension "Dimension":
        _Dimension()
        _Dimension(double, double, int)
        _Dimension(double, double, int, const string&)
        _Dimension(const Dimension&)
        
        void SetLabel(const string&)
        void SetMin(double)
        void SetMax(double)
        void SetStep(double)
        void SetBins(int)

        const string& Label()
        double Min()
        double Max()
        double Step()
        int Bins()
        bint MinIsSet()
        bint MaxIsSet()
        double Coord(size_t)
        int CalcBinsOrStep()
        void PrintDim()

cdef class Dimension:
    _Dimension* thisptr
