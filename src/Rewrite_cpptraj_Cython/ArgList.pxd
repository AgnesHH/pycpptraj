# distutils: language = c++

from libcpp.string cimport string as cstring

cdef extern from "ArgList.h":
    cdef cppclass ArgList:
        ArgList()
        ArgList(const char*)
        #ArgList(cstring const&)
        #ArgList(cstring const&, const char*)
        #ArgList(const ArgList&)
        #ArgList& operator=(const ArgList&)
        void AddArg(cstring input)
        bint hasKey(char * mystring)
        bint CheckForMoreArgs()
        void PrintList()
        void ClearList()

        int getKeyInt(const char*, int)
        double getKeyDouble(const char*, double)
