# distutils: language = c++
from Action cimport *


cdef extern from "Action_Translate.h": 
    cdef cppclass Action_Translate "Action_Translate":
        Action_Translate() 
        DispatchObject * Alloc() 
        void Help() 
