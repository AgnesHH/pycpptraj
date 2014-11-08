# distutil: language = c++

from libcpp.string cimport string
from FileName cimport *
from FileIO  cimport *

cdef extern from "CpptrajFile.h":
    ctypedef enum AccessType "CpptrajFile::AccessType":
        pass
    ctypedef enum CompressType "CpptrajFile::CompressType":
        pass
    ctypedef enum FileType "CpptrajFile::FileType":
        pass
    cdef cppclass _CpptrajFile "CpptrajFile":
        CpptrajFile()
        CpptrajFile(const CpptrajFile&)

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
        void Printf(const char*, ...)
        string GetLine()
        const char* NextLine()
        AccessType Access()
        CompressType Compression()
        bint IsOpen()
        const _Filename& Filename()
        int IsDos()
        off_t FileSize()
        bint IsCompressed()
        off_t UncompressedSize()
        int Gets(char*, int)
        int Write(const void*, size_t)
        int Read(void*, size_t)
        int Seek(off_t)
        int Rewind()
        int Flush()
        off_t Tell()

        #protected: Does Cython can call?
        #const size_t BUF_SIZE 
        #char linebuffer_[BUF_SIZE]

cdef class CpptrajFile:
    cdef _CpptrajFile* thisptr
