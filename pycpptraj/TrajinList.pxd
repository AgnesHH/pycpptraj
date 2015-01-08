# distutils: language = c++
from vector_pycpptraj cimport vector as cppvector
from trajs.Trajin cimport *
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
        int AddTrajin(const string&, _ArgList &, const _TopologyList&)
        int AddEnsemble(const string&, _ArgList &, const _TopologyList&)
        cppvector[_Trajin*].const_iterator begin ()const 
        cppvector[_Trajin*].const_iterator end ()const 
        bint empty ()const 
        TrajModeType Mode ()const 
        const _Trajin * front ()const 
        int MaxFrames ()const 
        void List ()const 


cdef class TrajinList:
    cdef _TrajinList* thisptr
    cdef bint py_free_mem
