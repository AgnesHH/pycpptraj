# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DataSet_Vector cimport *


cdef extern from "Action_Vector.h": 
    cdef cppclass _Action_Vector "Action_Vector" (_Action):
        _Action_Vector() 
        #~_Action_Vector() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_Vector (Action):
    cdef _Action_Vector* thisptr

