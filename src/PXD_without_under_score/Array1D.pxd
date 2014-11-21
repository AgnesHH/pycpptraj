# distutils: language = c++
from libcpp.vector cimport vector
from DataSetList cimport *
from DataSet_1D cimport *
from ArgList cimport *


cdef extern from "Array1D.h": 
    cdef cppclass Array1D "Array1D":
        Array1D() 
        Array1D(const Array1D&)
        #Array1D& operator =(const Array1D&)
        Array1D(const DataSetList&)
        size_t DetermineMax() const 
        int push_back(DataSet_1D * const&)
        DataSet_1D * const& operator[](int idx) const 
        DataSet_1D * operator[](int idx)
        bint empty() const 
        #const_iterator begin() const 
        #const_iterator end() const 
        size_t size() const 
        void clear() 
        void SortArray1D() 
        int AddDataSets(const DataSetList&)
        int AddTorsionSets(const DataSetList&)
        int AddSetsFromArgs(const ArgList&, const DataSetList&)
        int CheckXDimension() const 
