# distutils: language = c++
from libcpp.string cimport string
from ArgList cimport *
from Topology cimport *
from CpptrajFile cimport *
from BaseIOtype cimport *


cdef extern from "ParmIO.h": 
    cdef cppclass _ParmIO "ParmIO":
        # this is Abstract Base Class
        # below are virtual methods
        #~_ParmIO() 
        bint ID_ParmFormat(_CpptrajFile&)= 0 
        int processReadArgs(_ArgList&)= 0 
        int ReadParm(const string&, _Topology&)= 0 
        int processWriteArgs(_ArgList&)= 0 
        int WriteParm(const string&, const _Topology&)= 0 
        void SetDebug(int)= 0 


cdef class ParmIO:
    # use baseptr (instead of thisptr) as a name for base class 
    cdef _ParmIO* baseptr

