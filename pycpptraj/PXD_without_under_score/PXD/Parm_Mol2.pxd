# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *


cdef extern from "Parm_Mol2.h": 
    cdef cppclass Parm_Mol2 "Parm_Mol2":
        BaseIOtype * Alloc() 
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(const string&, Topology&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int)
        int processWriteArgs(ArgList&)
