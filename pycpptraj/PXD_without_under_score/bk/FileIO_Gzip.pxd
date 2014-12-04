# distutils: language = c++
from zlib cimport *
from FileIO cimport *


cdef extern from "FileIO_Gzip.h": 
    cdef cppclass FileIO_Gzip "FileIO_Gzip":
        FileIO_Gzip() 
        #~FileIO_Gzip() 
        int Open(const char *, const char *)
        int Close() 
        off_t Size(const char *)
        int Read(void *, size_t)
        int Write(const void *, size_t)
        int Flush() 
        int Seek(off_t)
        int Rewind() 
        off_t Tell() 
        int Gets(char *, int)
        int SetSize(long int)
