# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from Vec3 cimport *


cdef extern from "Action_Spam.h": 
    cdef cppclass _Action_Spam "Action_Spam":
        _Action_Spam() 
        _DispatchObject * Alloc() 
        void Help() 
