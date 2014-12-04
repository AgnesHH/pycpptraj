# distutils: language = c++
from Action cimport *


cdef extern from "Action_Radgyr.h": 
    cdef cppclass Action_Radgyr "Action_Radgyr":
        Action_Radgyr() 
        DispatchObject * Alloc() 
        void Help() 
