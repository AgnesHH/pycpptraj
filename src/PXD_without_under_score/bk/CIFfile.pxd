# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Atom cimport *
from BufferedLine cimport *


cdef extern from "CIFfile.h": 
    cdef cppclass CIFfile::DataBlock "CIFfile::DataBlock":
        DataBlock() 
        const string& Header() const 
        bint empty() const 
        int AddHeader(const string&)
        int AddSerialDataRecord(const char *, BufferedLine&)
        int AddLoopColumn(const char *)
        int AddLoopData(const char *, BufferedLine&)
        void ListData() const 
        int ColumnIndex(const string&) const 
        string Data(const string&) const 
        data_it begin() const 
        data_it end() const 
    cdef cppclass CIFfile "CIFfile":
        CIFfile() 
        bint ID_CIF(CpptrajFile&)
        int Read(const string&, int)
        const DataBlock& GetDataBlock(const string&) const 
        const FileName& CIFname() const 
