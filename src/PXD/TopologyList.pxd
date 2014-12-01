# distutil: language = c++
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *

cdef extern from "TopologyList.h":
    cdef cppclass _TopologyList "TopologyList":
        const char* ParmArgs
        TopologyList()
        void Clear()
        void SetDebug(int)
        _Topology* GetParm(int)
        _Topology* GetParmByIndex(_ArgList&)
        _Topology* GetParm(_ArgList&)
        int AddParmFile(string&)
        int AddParmFile(string&, _ArgList&)
        void List()

cdef class TopologyList:
    cdef _TopologyList* thisptr
