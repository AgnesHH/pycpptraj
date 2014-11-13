# distutils: language = c++
from Action cimport *
from AtomMap cimport *


cdef extern from "Action_AtomMap.h": 
    cdef cppclass _Action_AtomMap "Action_AtomMap":
        _Action_AtomMap() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_AtomMap() 
