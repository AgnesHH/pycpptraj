# distutil: language = c++

from libcpp.string cimport string
from BaseIOtype cimport *
from ParmIO cimport *
from Topology cimport *
from CpptrajFile cimport *
from ArgList cimport *


cdef extern from "Parm_Amber.h":
    cdef cppclass Parm_Amber:
        Parm_Amber()
        BaseIOtype* Alloc()
        bint ID_ParmFormat(CpptrajFile&)
        int processReadArgs(ArgList&)
        int ReadParm(string&, Topology&)
        int processWriteArgs(ArgList&)
        int WriteParm(const string&, const Topology&)
        void SetDebug(int)

