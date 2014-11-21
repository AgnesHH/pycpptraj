# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *


cdef extern from "Action_Diffusion.h": 
    cdef cppclass Action_Diffusion "Action_Diffusion":
        Action_Diffusion() 
        DispatchObject * Alloc() 
        void Help() 
