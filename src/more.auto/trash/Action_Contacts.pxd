# distutils: language = c++
from Action cimport *


cdef extern from "Action_Contacts.h": 
    cdef cpplass _Action_Contacts "Action_Contacts":
        _Action_Contacts() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Contacts() 
