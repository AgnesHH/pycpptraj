# distutils: language = c++
from libcpp.string cimport string


cdef extern from "NameType.h": 
    cdef cppclass NameType "NameType":
        NameType() 
        NameType(const NameType&)
        NameType(const char *)
        NameType(const string&)
        #NameType& operator =(const NameType&)
        void ToBuffer(char *) const 
        bint Match(const NameType&) const 
        #bint operator ==(const NameType&) const 
        #bint operator ==(const char *) const 
        bint operator !=(const NameType&) const 
        bint operator !=(const char *) const 
        const char * operator *() const 
        char operator[](int) const 
        string Truncated() const 
        void ReplaceAsterisk() 
