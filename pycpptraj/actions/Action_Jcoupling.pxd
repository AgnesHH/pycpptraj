# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_Jcoupling.h": 
    cdef cppclass _Action_Jcoupling "Action_Jcoupling" (_Action):
        _Action_Jcoupling() 
        #~_Action_Jcoupling() 
        _DispatchObject * Alloc() 
        void Help() 


    cdef cppclass _Action_Jcoupling::karplusConstant "Action_Jcoupling::karplusConstant" (_Action):


    cdef cppclass _Action_Jcoupling::jcouplingInfo "Action_Jcoupling::jcouplingInfo" (_Action):


cdef class Action_Jcoupling (Action):
    cdef _Action_Jcoupling* thisptr

cdef class Action_Jcoupling::karplusConstant (Action):
    cdef _Action_Jcoupling::karplusConstant* thisptr

cdef class Action_Jcoupling::jcouplingInfo (Action):
    cdef _Action_Jcoupling::jcouplingInfo* thisptr

