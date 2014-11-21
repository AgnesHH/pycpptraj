# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_Distance.h": 
    cdef cppclass Action_Distance "Action_Distance":
        Action_Distance() 
        DispatchObject * Alloc() 
        void Help() 
        int NOE_Args(ArgList& argIn, double&, double&, double&)
