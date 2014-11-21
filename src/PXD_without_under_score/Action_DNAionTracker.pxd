# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_DNAionTracker.h": 
    cdef cppclass Action_DNAionTracker "Action_DNAionTracker":
        Action_DNAionTracker() 
        DispatchObject * Alloc() 
        void Help() 
