# distutils: language = c++
from posix.unistd cimport off_t
from libcpp.string cimport string
from FileName cimport *
from FileIO cimport *


cdef extern from "CpptrajFile.h": 
    # CpptrajFile.h
    ctypedef enum AccessType "CpptrajFile::AccessType":
        READ "CpptrajFile::READ"
        WRITE "CpptrajFile::WRITE"
        APPEND "CpptrajFile::APPEND"
        UPDATE "CpptrajFile::UPDATE"
    # CpptrajFile.h
    ctypedef enum CompressType "CpptrajFile::CompressType":
        NO_COMPRESSION "CpptrajFile::NO_COMPRESSION"
        GZIP "CpptrajFile::GZIP"
        BZIP2 "CpptrajFile::BZIP2"
        ZIP "CpptrajFile::ZIP"
    # CpptrajFile.h
    ctypedef enum FileType "CpptrajFile::FileType":
        UNKNOWN_TYPE "CpptrajFile::UNKNOWN_TYPE"
        STANDARD "CpptrajFile::STANDARD"
        GZIPFILE "CpptrajFile::GZIPFILE"
        BZIP2FILE "CpptrajFile::BZIP2FILE"
        ZIPFILE "CpptrajFile::ZIPFILE"
        MPIFILE "CpptrajFile::MPIFILE"
    cdef cppclass CpptrajFile "CpptrajFile":
        CpptrajFile() 
        CpptrajFile(const CpptrajFile&)
        #CpptrajFile& operator =(const CpptrajFile&)
        int OpenRead(const string&)
        int SetupRead(const string&, int)
        int OpenWriteNumbered(int)
        int OpenWrite(const string&)
        int OpenEnsembleWrite(const string&, int)
        int SetupWrite(const string&, int)
        int SetupWrite(const string&, FileType, int)
        int OpenAppend(const string&)
        int OpenEnsembleAppend(const string&, int)
        int SetupAppend(const string&, int)
        int OpenFile() 
        int OpenFile(AccessType)
        void CloseFile() 
        void Printf(const char *,)
        string GetLine() 
        const char * NextLine() 
        AccessType Access() const 
        CompressType Compression() const 
        bint IsOpen() const 
        const FileName& Filename() const 
        int IsDos() const 
        off_t FileSize() const 
        bint IsCompressed() 
        off_t UncompressedSize() 
        int Gets(char * buf, int num)
        int Write(const void * buf, size_t num)
        int Read(void * buf, size_t num)
        int Seek(off_t offset)
        int Rewind() 
        int Flush() 
        off_t Tell() 
