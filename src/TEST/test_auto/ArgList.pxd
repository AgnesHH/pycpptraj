# distutils: language = c++

from libcpp.string cimport string 

cdef extern from "ArgList.h":
    cdef cppclass _ArgList "ArgList":
        void AddArg(string input)
        bool hasKey(char * mystring)
        bool CheckForMoreArgs()
        void PrintList()
        void ClearList()
