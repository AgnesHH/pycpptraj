# distutils: language = c++
from libcpp.string cimport string
from Action cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_AtomicFluct.h": 
    cdef cppclass Action_AtomicFluct "Action_AtomicFluct":
        Action_AtomicFluct() 
        DispatchObject * Alloc() 
        void Help() 
