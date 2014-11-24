# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from CpptrajFile cimport *


cdef extern from "BufferedLine.h": 
    cdef cppclass BufferedLine "BufferedLine":
        BufferedLine() 
        #~BufferedLine() 
        const char * Line() 
        int TokenizeLine(const char *)
        const char * NextToken() 
        inline const char * Token(int)
        int OpenFileRead(const string& fname)
        int LineNumber() const 
        const char * Buffer() const 
