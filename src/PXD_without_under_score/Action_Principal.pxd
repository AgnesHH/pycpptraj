# distutils: language = c++
from Action cimport *


cdef extern from "Action_Principal.h": 
    cdef cppclass Action_Principal "Action_Principal":
        Action_Principal() 
        DispatchObject * Alloc() 
        void Help() 
