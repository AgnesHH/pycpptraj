# distutils: language = c++

from libcpp.string cimport string as c_string

cdef extern from "ArgList.h":
    cdef cppclass ArgList:
        void AddArg(c_string input)
