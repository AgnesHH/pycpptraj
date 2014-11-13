# distutils: language = c++
from DataIO cimport *


cdef extern from "DataIO_Evecs.h": 
    cdef cpplass _DataIO_Evecs "DataIO_Evecs":
        _DataIO_Evecs() 
        static _BaseIOtype * Alloc() 
        static void ReadHelp() 
        int ReadData(const string&, _ArgList &, _DataSetList &, const string&)
        int processWriteArgs(_ArgList &)
        int WriteData(const string&, const _DataSetList&)
        int WriteData2D(const string&, const _DataSetList&)
        int WriteData3D(const string&, const _DataSetList&)
        bint ID_DataFormat(_CpptrajFile &)
