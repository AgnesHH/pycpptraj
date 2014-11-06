# distutils: language = c++

from libcpp.string cimport string as c_string

cdef extern from "ArgList.h":
    cdef cppclass _ArgList "ArgList":
        void AddArg(c_string input)
        bint hasKey(char * mystring)
        bint CheckForMoreArgs()
        void PrintList()
        void ClearList()

cdef class ArgList:
    cdef _ArgList* thisptr

