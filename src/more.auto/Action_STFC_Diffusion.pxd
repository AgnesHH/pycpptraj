# distutils: language = c++
from Action cimport *


cdef extern from "Action_STFC_Diffusion.h": 
    cdef cppclass _Action_STFC_Diffusion "Action_STFC_Diffusion":
        _Action_STFC_Diffusion() 
        static _DispatchObject * Alloc() 
        static void Help() 
