# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from DataIO cimport *


cdef extern from "DataIO_Gnuplot.h": 
    cdef cppclass DataIO_Gnuplot "DataIO_Gnuplot":
        DataIO_Gnuplot() 
        BaseIOtype * Alloc() 
        void WriteHelp() 
        int ReadData(const string&, ArgList&, DataSetList&, const string&)
        int processWriteArgs(ArgList&)
        int WriteData(const string&, const DataSetList&)
        int WriteData2D(const string&, const DataSetList&)
        int WriteData3D(const string&, const DataSetList&)
        bint ID_DataFormat(CpptrajFile&)
