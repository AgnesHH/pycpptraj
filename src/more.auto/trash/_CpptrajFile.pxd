# distutils: language = c++
from FileName cimport *
from FileIO cimport *


cdef extern from "CpptrajFile.h": 
    cdef cpplass _CpptrajFile "CpptrajFile":
        _CpptrajFile() 
        #_CpptrajFile(const _CpptrajFile &)
        #_CpptrajFile & operator =(const _CpptrajFile &)
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
        #void Printf(const char *,...)
        void Printf(const char *)
        string GetLine() 
        const char * NextLine() 
        AccessType Access() const 
        CompressType Compression() const 
        bint IsOpen() const 
        const _FileName & Filename() const 
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


cdef class CpptrajFile:
    cdef _CpptrajFile* thisptr
