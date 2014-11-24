# distutils: language = c++
from Action cimport *
from molsurf cimport *


cdef extern from "Action_Molsurf.h": 
    cdef cppclass Action_Molsurf "Action_Molsurf":
        Action_Molsurf() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Molsurf() 
