# distutil: language = c++

from libcpp.string cimport string
from DataFile cimport *
from DataSet cimport *
from ArgList cimport *

cdef extern from "DataFileList.h":
    cdef cppclass _DataFileList "DataFileList":
        DataFileList()
        void Clear()
        _DataFile* RemoveDataFile(_DataFile*)
        void Remove_DataSet(_DataSet*)
        void SetDebug(int)
        _DataFile* GetDataFile(string&)
        _DataFile* AddDataFile(string&, _ArgList&)
        _DataFile* AddDataFile(string&)
        _DataFile* AddSetToFile(string&, _DataSet*) 
        void List()
        void WriteAllDF()
        void Remove_DataSet()
        int ProcessDataFileArgs(_ArgList&)

cdef class DataFileList:
    cdef _DataFileList* thisptr
