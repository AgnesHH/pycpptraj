# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *


cdef extern from "Parm_CharmmPsf.h": 
    cdef cppclass Parm_CharmmPsf "Parm_CharmmPsf":
        BaseIOtype * Alloc() 
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(const string&, Topology&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int)
        int processWriteArgs(ArgList&)
