# distutils: language = c++
from Action cimport *


cdef extern from "Action_Principal.h": 
    cdef cppclass _Action_Principal "Action_Principal":
        _Action_Principal() 
        _DispatchObject * Alloc() 
        void Help() 
