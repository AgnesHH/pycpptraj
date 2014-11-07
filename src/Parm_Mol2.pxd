# distutil: language = c++

from libcpp.string cimport string
from ArgList cimport *
from CpptrajFile cimport *
from Topology cimport *

cdef extern from "Parm_Mol2.h":
    cdef cppclass _Parm_Mol2 "Parm_Mol2":
        BaseIOtype* Alloc()
        bint ID_ParmFormat(_CpptrajFile&)
        int processReadArgs(_ArgList&)
        int ReadParm(const string&, _Topology&)
        int WriteParm(const string&, const _Topology&)
        void SetDebug(int)
        int processWriteArgs(_ArgList&)

cdef class Parm_Mol2:
    cdef _Parm_Mol2* thisptr
