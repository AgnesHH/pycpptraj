# distutils: language = c++
from Action cimport *


cdef extern from "Action_FixAtomOrder.h": 
    cdef cpplass _Action_FixAtomOrder "Action_FixAtomOrder":
        _Action_Fix_AtomOrder() 
        #~_Action_Fix_AtomOrder() 
        static _DispatchObject * Alloc() 
        static void Help() 
