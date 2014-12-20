# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_CheckStructure.h": 
    cdef cppclass _Action_CheckStructure::Problem "Action_CheckStructure::Problem" (_Action):
        Problem() 
        Problem(int f)
        Problem(const Problem& rhs)


    cdef cppclass _Action_CheckStructure "Action_CheckStructure" (_Action):
        _Action_CheckStructure() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_CheckStructure() 
        _Action::RetType Init(_ArgList&, _TopologyList *, _FrameList *, _DataSetList *, _DataFileList *, int)
        _Action::RetType Setup(_Topology *, _Topology * *)
        int Check_Frame(int, const _Frame&)
        void Print() 


    cdef cppclass _Action_CheckStructure::bond_list "Action_CheckStructure::bond_list" (_Action):


    cdef cppclass _Action_CheckStructure::bond_list_cmp "Action_CheckStructure::bond_list_cmp" (_Action):
        inline bint operator()(const bond_list& first, const bond_list& second) const 


cdef class Action_CheckStructure::Problem (Action):
    cdef _Action_CheckStructure::Problem* thisptr

cdef class Action_CheckStructure (Action):
    cdef _Action_CheckStructure* thisptr

cdef class Action_CheckStructure::bond_list (Action):
    cdef _Action_CheckStructure::bond_list* thisptr

cdef class Action_CheckStructure::bond_list_cmp (Action):
    cdef _Action_CheckStructure::bond_list_cmp* thisptr

