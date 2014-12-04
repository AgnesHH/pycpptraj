# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Topology cimport *
from ArgList cimport *


cdef extern from "TopologyList.h": 
    cdef cppclass TopologyList "TopologyList":
        TopologyList() 
        #~TopologyList() 
        void Clear() 
        void SetDebug(int)
        Topology * GetParm(int) const 
        Topology * GetParmByIndex(ArgList&) const 
        Topology * GetParm(ArgList&) const 
        int AddParmFile(const string&)
        int AddParmFile(const string&, ArgList&)
        void List() const 
