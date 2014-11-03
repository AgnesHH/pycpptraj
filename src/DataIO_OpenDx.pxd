# distutil: language = c++

cdef extern from "DataIO_OpenDx.h":
    cdef cppclass _DataIO_OpenDx "DataIO_OpenDx":
        _DataIO_OpenDx()
        BaseIOtype* Alloc()
        int ReadData(const string&, _ArgList&, _DataSetList&, const string&)
        int processWriteArgs(_ArgList&)
        int WriteData(const string&, const _DataSetList&)
        int WriteData2D(const string&, const _DataSetList&)
        int WriteSet3D(const string&, _DataSetList&)
        bint ID_DataFormat(_CpptrajFile&)
