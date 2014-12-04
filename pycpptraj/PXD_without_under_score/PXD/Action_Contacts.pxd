# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_Contacts.h": 
    cdef cppclass Action_Contacts "Action_Contacts":
        Action_Contacts() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Contacts() 
