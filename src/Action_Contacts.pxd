# distutils: language = c++
from Action cimport *


cdef extern from "Action_Contacts.h": 
    cdef cppclass _Action_Contacts "Action_Contacts":
        _Action_Contacts() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Contacts() 
