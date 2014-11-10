# distutils: language = c++

from libcpp.string cimport string as string

cdef extern from "ArgList.h":
    cdef cppclass _ArgList "ArgList":
        void AddArg(string input)
        bint hasKey(char * mystring)
        bint CheckForMoreArgs()
        void PrintList()
        void ClearList()

cdef class ArgList:
    cdef _ArgList* thisptr

