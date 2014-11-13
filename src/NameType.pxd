# distutil: language = c++

from libcpp.string cimport string

cdef extern from "NameType.h":
    cdef cppclass _NameType "NameType":
        _NameType()
        _NameType(_NameType&)
        _NameType(string&)

        void ToBuffer(char*)
        bint Match(_NameType&)
        string Truncated()
        void ReplaceAsterisk()
