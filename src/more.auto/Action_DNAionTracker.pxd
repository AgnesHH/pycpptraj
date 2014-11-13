# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_DNAionTracker.h": 
    cdef cppclass _Action_DNAionTracker "Action_DNAionTracker":
        _Action_DNAionTracker() 
        static _DispatchObject * Alloc() 
        static void Help() 
