# distutils: language = c++
from libcpp.string cimport string
from pycpptraj.datasets.DataIO cimport *
from pycpptraj.datasets.DataSet cimport _DataSet, DataSet
from pycpptraj.FileTypes cimport _FileTypes, FileTypes
from pycpptraj.ArgList cimport _ArgList, ArgList
from pycpptraj.DataSetList cimport _DataSetList, DataSetList
from pycpptraj.FileName cimport _FileName, FileName


cdef extern from "DataFile.h": 
    # DataFile.h
    ctypedef enum DataFormatType "DataFile::DataFormatType":
        DATAFILE "DataFile::DATAFILE"
        XMGRACE "DataFile::XMGRACE"
        GNUPLOT "DataFile::GNUPLOT"
        XPLOR "DataFile::XPLOR"
        OPENDX "DataFile::OPENDX"
        REMLOG "DataFile::REMLOG"
        MDOUT "DataFile::MDOUT"
        EVECS "DataFile::EVECS"
        UNKNOWN_DATA "DataFile::UNKNOWN_DATA"
    cdef cppclass _DataFile "DataFile":
        _DataFile() 
        #~_DataFile() 
        void WriteHelp() 
        void ReadOptions() 
        void WriteOptions() 
        DataFormatType GetFormatFromArg(_ArgList& a)
        const char * FormatString(DataFormatType t)
        const char * FormatString() const 
        void SetDebug(int)
        void Set_DataFilePrecision(int, int)
        int ReadDataIn(const string&, const _ArgList&, _DataSetList&)
        int SetupDatafile(const string&, _ArgList&, int)
        void SetDataFilePrecision(int, int)
        int AddSet(_DataSet *)
        int RemoveSet(_DataSet *)
        int ProcessArgs(_ArgList&)
        int ProcessArgs(const string&)
        void WriteData() 
        void DataSetNames() const 
        const _FileName& _DataFilename() const 
        void SetDFLwrite(bint fIn)
        bint DFLwrite() const 
        DataFormatType Type() const 


cdef class DataFile:
    cdef _DataFile* thisptr
    cdef bint py_free_mem

