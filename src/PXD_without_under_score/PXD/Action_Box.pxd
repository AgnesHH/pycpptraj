# distutils: language = c++
from Action cimport *


cdef extern from "Action_Box.h": 
    cdef cppclass Action_Box "Action_Box":
        Action_Box() 
        DispatchObject * Alloc() 
        void Help() 
