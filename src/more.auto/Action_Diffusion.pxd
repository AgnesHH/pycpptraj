# distutils: language = c++
from Action cimport *


cdef extern from "Action_Diffusion.h": 
    cdef cpplass _Action_Diffusion "Action_Diffusion":
        _Action_Diffusion() 
        static _DispatchObject * Alloc() 
        static void Help() 
