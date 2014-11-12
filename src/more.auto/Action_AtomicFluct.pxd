# distutils: language = c++
from Action cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_AtomicFluct.h": 
    cdef cpplass _Action_AtomicFluct "Action_AtomicFluct":
        _Action_AtomicFluct() 
        static _DispatchObject * Alloc() 
        static void Help() 
