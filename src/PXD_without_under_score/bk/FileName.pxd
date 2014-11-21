# distutils: language = c++
from libcpp.string cimport string


cdef extern from "FileName.h": 
    cdef cppclass FileName "FileName":
        FileName() 
        FileName(const FileName&)
        #FileName& operator =(const FileName&)
        int SetFileName(const string&)
        int SetFileNameWithExpansion(const string&)
        int SetFileName(const string&, bint)
        void clear() 
        bint MatchFullOrBase(const string&) const 
        const string& Full() const 
        const string& Base() const 
        const char * full() const 
        const char * base() const 
        const string& Ext() const 
        const string& Compress() const 
        const string& DirPrefix() const 
        bint empty() const 
