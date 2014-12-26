# distutils: language = c++
#from libcpp.vector cimport vector
#from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_AutoImage.h": 
    cdef cppclass _Action_AutoImage "Action_AutoImage" (_Action):
        _Action_AutoImage() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_AutoImage (Action):
    cdef _Action_AutoImage* thisptr

