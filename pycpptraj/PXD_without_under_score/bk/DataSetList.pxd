[1430] WARN unresolved _iterator
# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from DataSet cimport *


cdef extern from "DataSetList.h": 
    cdef cppclass DataSetList "DataSetList":
        DataSetList() 
        #~DataSetList() 
        void Clear() 
        DataSetList& operator + =(const DataSetList&)
        #const_iterator begin() const 
        #const_iterator end() const 
        bint empty() const 
        size_t size() const 
        int EnsembleNum() const 
        #void RemoveSet(const_iterator)
        void RemoveSet(DataSet *)
        DataSet * operator[](int didx)
        void SetDebug(int)
        void SetEnsembleNum(int i)
        void AllocateSets(long int)
        void SetPrecisionOfDataSets(const string&, int, int)
        DataSet * GetSet(const string&, int, const string&) const 
        DataSet * GetDataSet(const string&) const 
        DataSetList GetMultipleSets(const string&) const 
        string GenerateDefaultName(const char *) const 
        DataSet * AddSet(DataType, const string&, const char *)
        DataSet * AddSetIdx(DataType, const string&, int)
        DataSet * AddSetAspect(DataType, const string&, const string&)
        DataSet * AddSetIdxAspect(DataType, const string&, int, const string&)
        DataSet * AddSetIdxAspect(DataType, const string&, int, const string&, const string&)
        void AddCopyOfSet(DataSet *)
        void List() const 
        void SynchronizeData() 
        DataSet * FindSetOfType(const string&, DataType) const 
        DataSet * FindCoordsSet(const string&)
    cdef cppclass DataSetList::DataToken "DataSetList::DataToken":
