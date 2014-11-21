# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from ParmIO cimport *


cdef extern from "Parm_Amber.h": 
    cdef cppclass Parm_Amber "Parm_Amber":
        Parm_Amber() 
        #~Parm_Amber() 
        BaseIOtype * Alloc() 
        void WriteHelp() 
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(const string&, Topology&)
        int processWriteArgs(ArgList&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int debugIn)
    cdef cppclass Parm_Amber::ParmFlag "Parm_Amber::ParmFlag":
