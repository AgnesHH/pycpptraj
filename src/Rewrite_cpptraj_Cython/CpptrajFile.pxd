# distutil: language = c++

from libcpp.string cimport string
cdef extern from "CpptrajFile.h":
    cdef cppclass CpptrajFile:
        #enum
        #enum
        #enum
        CpptrajFile()
        #CpptrajFile(const CpptrajFile&)
        #CpptrajFile &operator=(const CpptrajFile&)
        #not done yet
        void OpenWrite(string&)
        void Printf(char*,char*, double, char*)
        void CloseFile()
