# distutils: language = c++
from libcpp.string cimport string
from DataIO cimport *


cdef extern from "DataIO_Grace.h": 
    cdef cppclass DataIO_Grace "DataIO_Grace":
        DataIO_Grace() : DataIO(true, false, false ), isInverted_(false)
        BaseIOtype * Alloc() 
        void WriteHelp() 
        int ReadData(const string&, ArgList&, DataSetList&, const string&)
        int processWriteArgs(ArgList&)
        int WriteData(const string&, const DataSetList&)
        int WriteData2D(const string&, const DataSetList&)
        int WriteData3D(const string&, const DataSetList&)
        bint ID_DataFormat(CpptrajFile&)
