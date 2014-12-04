# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from DataFile cimport *
from DataSet cimport *
from ArgList cimport *


cdef extern from "DataFileList.h": 
    cdef cppclass DataFileList "DataFileList":
        DataFileList() 
        #~DataFileList() 
        void Clear() 
        DataFile * RemoveDataFile(DataFile *)
        void RemoveDataSet(DataSet *)
        void SetDebug(int)
        void SetEnsembleMode(int mIn)
        DataFile * GetDataFile(const string&) const 
        DataFile * AddDataFile(const string&, ArgList&)
        DataFile * AddDataFile(const string&)
        DataFile * AddSetToFile(const string&, DataSet *)
        void List() const 
        void WriteAllDF() 
        void ResetWriteStatus() 
        int ProcessDataFileArgs(ArgList&)
