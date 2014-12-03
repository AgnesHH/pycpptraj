# distutils: language = c++
from Action cimport *
from molsurf cimport *


cdef extern from "Action_Molsurf.h": 
    cdef cppclass _Action_Molsurf "Action_Molsurf":
        _Action_Molsurf() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Molsurf() 
