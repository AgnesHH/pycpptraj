# distutils: language = c++
from libcpp.string cimport string
from pycpptraj.datasets.DataSet cimport _DataSet, DataSet, DataType
from pycpptraj.cpp_vector cimport vector as cppvector

ctypedef cppvector[_DataSet*] DataListType
ctypedef cppvector[_DataSet*].const_iterator const_iterator

cdef extern from "DataSetList.h": 
    cdef cppclass _DataSetList "DataSetList":
        _DataSetList() 
        #~_DataSetList() 
        void Clear() 
        _DataSetList& addequal "operator +="(const _DataSetList&)
        const_iterator begin() const 
        const_iterator end() const 
        bint empty() const 
        size_t size() const 
        int EnsembleNum() const 
        void RemoveSet(const_iterator)
        void RemoveSet(_DataSet *)
        _DataSet * index_opr "operator[]"(int didx)
        void SetDebug(int)
        void SetEnsembleNum(int i)
        void AllocateSets(long int)
        void SetPrecisionOfDataSets(const string&, int, int)
        void SynchronizeData()
        _DataSet * GetSet(const string&, int, const string&) const 
        _DataSet * GetDataSet(const string&) const 
        _DataSetList GetMultipleSets(const string&) const 
        string GenerateDefaultName(const char *) const 
        _DataSet * AddSet(DataType, const string&, const char *)
        _DataSet * AddSetIdx(DataType, const string&, int)
        _DataSet * AddSetAspect(DataType, const string&, const string&)
        _DataSet * AddSetIdxAspect(DataType, const string&, int, const string&)
        _DataSet * AddSetIdxAspect(DataType, const string&, int, const string&, const string&)
        void AddCopyOfSet(_DataSet *)
        void List() const 
        void SynchronizeData() 
        _DataSet * FindSetOfType(const string&, DataType) const 
        _DataSet * FindCoordsSet(const string&)


cdef class DataSetList:
    cdef _DataSetList* thisptr
    cdef bint py_free_mem
