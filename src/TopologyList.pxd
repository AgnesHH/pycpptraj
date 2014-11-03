# distutil: language = c++
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *

cdef extern from "TopologyList.h":
    cdef cppclass TopologyList:
        const char* ParmArgs
        TopologyList()
        void Clear()
        void SetDebug(int)
        Topology* GetParm(int)
        Topology* GetParmByIndex(ArgList&)
        Topology* GetParm(ArgList&)
        int AddParmFile(string&)
        int AddParmFile(string&, ArgList&)
        void List()
