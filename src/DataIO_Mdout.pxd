# distutil: language = c++

from BaseIOtype cimport *
from ArgList cimport *
from DataSetList cimport *
from CpptrajFile cimport *

cdef extern from "DataIO_Mdout.h":
    cdef cppclass _DataIO_Mdout "DataIO_Mdout":
        _DataIO_Mdout()
        BaseIOtype* Alloc()
        void ReadHelp()
        int ReadData(const string&, _ArgList&, DataSetList&, const string&)
        int processWriteArgs(_ArgList&)
        int WriteData(const string&, const _DataSetList&)
        int WriteData2D(const string&, const _DataSetList&)
        int WriteData3D(const string&, const _DataSetList&)
        bint ID_DataFormat(_CpptrajFile&)

cdef class DataIO_Mdout:
    cdef _DataSetList* thisptr
