# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *


cdef extern from "Parm_CIF.h": 
    cdef cppclass Parm_CIF "Parm_CIF":
        Parm_CIF() : debug_(0)
        BaseIOtype * Alloc() 
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(const string&, Topology&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int i)
        int processWriteArgs(ArgList&)
