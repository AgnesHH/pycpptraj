# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from DataIO cimport *
from FileTypes cimport *
from FileName cimport *


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
    cdef cppclass DataFile "DataFile":
        DataFile() 
        #~DataFile() 
        void WriteHelp() 
        void ReadOptions() 
        void WriteOptions() 
        DataFormatType GetFormatFromArg(ArgList& a)
        const char * FormatString(DataFormatType t)
        const char * FormatString() const 
        void SetDebug(int)
        void SetDataFilePrecision(int, int)
        int ReadDataIn(const string&, const ArgList&, DataSetList&)
        int SetupDatafile(const string&, ArgList&, int)
        int AddSet(DataSet *)
        int RemoveSet(DataSet *)
        int ProcessArgs(ArgList&)
        int ProcessArgs(const string&)
        void WriteData() 
        void DataSetNames() const 
        const FileName& DataFilename() const 
        void SetDFLwrite(bint fIn)
        bint DFLwrite() const 
        DataFormatType Type() const 
