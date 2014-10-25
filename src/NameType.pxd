# distutil: language = c++

from libcpp.string cimport string

cdef extern from "NameType.h":
    cdef cppclass NameType:
        NameType()
        NameType(NameType&)
        NameType(string&)

        void ToBuffer(char*)
        bint Match(NameType&)
        string Truncated()
        void ReplaceAsterisk()
