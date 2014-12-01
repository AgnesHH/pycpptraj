# distutils: language = c++
from Action cimport *
from ActionFrameCounter cimport *


cdef extern from "Action_AtomicFluct.h": 
    cdef cppclass _Action_AtomicFluct "Action_AtomicFluct":
        _Action_AtomicFluct() 
        _DispatchObject * Alloc() 
        void Help() 
