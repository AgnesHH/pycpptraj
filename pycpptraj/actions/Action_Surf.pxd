# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_Surf.h": 
    cdef cppclass _Action_Surf::SurfInfo "Action_Surf::SurfInfo" (_Action):


    cdef cppclass _Action_Surf "Action_Surf" (_Action):
        _Action_Surf() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_Surf::SurfInfo (Action):
    cdef _Action_Surf::SurfInfo* thisptr

cdef class Action_Surf (Action):
    cdef _Action_Surf* thisptr

