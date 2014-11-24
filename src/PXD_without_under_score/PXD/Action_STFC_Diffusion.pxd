# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_STFC_Diffusion.h": 
    cdef cppclass Action_STFC_Diffusion "Action_STFC_Diffusion":
        Action_STFC_Diffusion() 
        DispatchObject * Alloc() 
        void Help() 
