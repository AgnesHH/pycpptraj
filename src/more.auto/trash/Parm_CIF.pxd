# distutils: language = c++
from ParmIO cimport *


cdef extern from "Parm_CIF.h": 
    cdef cpplass _Parm_CIF "Parm_CIF":
        _Parm_CIF() : debug_(0)
        static _BaseIOtype * Alloc() 
        bint ID_ParmFormat(_CpptrajFile &)
        int processReadArgs(_ArgList &)
        int ReadParm(const string&, _Topology &)
        int WriteParm(const string&, const _Topology&)
        void SetDebug(int i)
        int processWriteArgs(_ArgList &)
