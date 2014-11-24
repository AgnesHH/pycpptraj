# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from AtomMap cimport *


cdef extern from "Action_AtomMap.h": 
    cdef cppclass Action_AtomMap "Action_AtomMap":
        Action_AtomMap() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_AtomMap() 
