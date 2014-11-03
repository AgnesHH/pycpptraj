# distutil: language = c++

from libcpp.string cimport string
from DataFile cimport *
from DataSet cimport *
from ArgList cimport *

cdef extern from "DataFileList.h":
    cdef cppclass DataFileList:
        DataFileList()
        void Clear()
        DataFile* RemoveDataFile(DataFile*)
        void RemoveDataSet(DataSet*)
        void SetDebug(int)
        DataFile* GetDataFile(string&)
        DataFile* AddDataFile(string&, ArgList&)
        DataFile* AddDataFile(string&)
        DataFile* AddSetToFile(string&, DataSet*) 
        void List()
        void WriteAllDF()
        void RemoveDataSet()
        int ProcessDataFileArgs(ArgList&)
