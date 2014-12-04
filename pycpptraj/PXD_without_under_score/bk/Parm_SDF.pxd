# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *


cdef extern from "Parm_SDF.h": 
    cdef cppclass Parm_SDF "Parm_SDF":
        BaseIOtype * Alloc() 
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(const string&, Topology&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int)
        int processWriteArgs(ArgList&)
