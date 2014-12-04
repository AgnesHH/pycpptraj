# distutils: language = c++
from libcpp.string cimport string
from ParmIO cimport *


cdef extern from "Parm_PDB.h": 
    cdef cppclass Parm_PDB "Parm_PDB":
        Parm_PDB() : readAsPQR_(false)
        BaseIOtype * Alloc() 
        void ReadHelp() 
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(const string&, Topology&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int)
        int processWriteArgs(ArgList&)
