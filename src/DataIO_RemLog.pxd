# distutil: language = c++

from BaseIOtype cimport *
from ArgList cimport *
from DataSetList cimport *
from CpptrajFile cimport *

cdef extern from "DataIO_RemLog.h":
    cdef cppclass _DataIO_RemLog "DataIO_RemLog":
        _DataIO_RemLog()
        BaseIOtype* Alloc()
        void ReadHelp()
        int ReadData(const string&, _ArgList&, _DataSetList&, const string&)
        int processWriteArgs(_ArgList&)
        int WriteData(const string&, _DataSetList&)
        int WriteData2D(const string&, _DataSetList&)
        int WriteData3D(const string&, _DataSetList&)
        bint ID_DataFormat(_CpptrajFile&)

cdef class DataIO_RemLog:
    cdef _DataSetList* thisptr
