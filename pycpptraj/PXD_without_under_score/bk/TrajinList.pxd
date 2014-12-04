# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Trajin cimport *
from TopologyList cimport *


cdef extern from "TrajinList.h": 
    # TrajinList.h
    ctypedef enum TrajModeType "TrajinList::TrajModeType":
        UNDEFINED "TrajinList::UNDEFINED"
        NORMAL "TrajinList::NORMAL"
        ENSEMBLE "TrajinList::ENSEMBLE"
    cdef cppclass TrajinList "TrajinList":
        TrajinList() 
        #~TrajinList() 
        void Clear() 
        void SetDebug(int dIn)
        int AddTrajin(const string&, ArgList&, const TopologyList&)
        int AddEnsemble(const string&, ArgList&, const TopologyList&)
        #const_iterator begin() const 
        #const_iterator end() const 
        bint empty() const 
        TrajModeType Mode() const 
        const Trajin * front() const 
        int MaxFrames() const 
        void List() const 
