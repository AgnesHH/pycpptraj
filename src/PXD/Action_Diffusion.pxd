# distutils: language = c++
from Action cimport *


cdef extern from "Action_Diffusion.h": 
    cdef cppclass _Action_Diffusion "Action_Diffusion":
        _Action_Diffusion() 
        _DispatchObject * Alloc() 
        void Help() 
