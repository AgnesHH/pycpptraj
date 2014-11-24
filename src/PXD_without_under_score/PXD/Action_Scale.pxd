# distutils: language = c++
from Action cimport *


cdef extern from "Action_Scale.h": 
    cdef cppclass Action_Scale "Action_Scale":
        Action_Scale() 
        DispatchObject * Alloc() 
        void Help() 
