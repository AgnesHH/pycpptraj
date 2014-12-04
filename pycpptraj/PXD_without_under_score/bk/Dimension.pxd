# distutils: language = c++
from libcpp.string cimport string


cdef extern from "Dimension.h": 
    # Dimension.h
    ctypedef enum DimIdxType "Dimension::DimIdxType":
        X "Dimension::X"
        Y "Dimension::Y"
        Z "Dimension::Z"
    cdef cppclass Dimension "Dimension":
        Dimension() 
        Dimension(double, double, int)
        Dimension(double, double, int, const string&)
        Dimension(const Dimension&)
        #Dimension& operator =(const Dimension&)
        void SetLabel(const string& l)
        void SetMin(double m)
        void SetMax(double m)
        void SetStep(double s)
        void SetBins(int b)
        const string& Label() const 
        double Min() const 
        double Max() const 
        double Step() const 
        int Bins() const 
        bint MinIsSet() const 
        bint MaxIsSet() const 
        double Coord(size_t i) const 
        inline bint operator ! =(const Dimension&) const 
        int CalcBinsOrStep() 
        void PrintDim() const 
