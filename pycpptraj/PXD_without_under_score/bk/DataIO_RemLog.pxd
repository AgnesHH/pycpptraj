# distutils: language = c++
from libcpp.string cimport string
from DataIO cimport *
from BufferedLine cimport *


cdef extern from "DataIO_RemLog.h": 
    cdef cppclass DataIO_RemLog "DataIO_RemLog":
        DataIO_RemLog() 
        BaseIOtype * Alloc() 
        void ReadHelp() 
        int ReadData(const string&, ArgList&, DataSetList&, const string&)
        int processWriteArgs(ArgList&)
        int WriteData(const string&, const DataSetList&)
        int WriteData2D(const string&, const DataSetList&)
        int WriteData3D(const string&, const DataSetList&)
        bint ID_DataFormat(CpptrajFile&)
