# distutils: language = c++
from Trajin cimport *
from TopologyList cimport *


cdef extern from "TrajinList.h": 
    ctypedef enum TrajModeType "TrajinList::TrajModeType":
        UNDEFINED "TrajinList::UNDEFINED"
        NORMAL "TrajinList::NORMAL"
        ENSEMBLE "TrajinList::ENSEMBLE"
    cdef cppclass _TrajinList "TrajinList":
        _TrajinList ()
        #~_TrajinList ()
        void Clear ()
        void SetDebug(int dIn)
        int Add_Trajin(const string&, _ArgList &, const _TopologyList&)
        int AddEnsemble(const string&, _ArgList &, const _TopologyList&)
        #const_iterator begin ()const 
        #const_iterator end ()const 
        bint empty ()const 
        TrajModeType Mode ()const 
        const _Trajin * front ()const 
        int Max_Frames ()const 
        void List ()const 
