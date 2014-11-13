# distutils: language = c++
from Action cimport *


cdef extern from "Action_Pairwise.h": 
    cdef cpplass _Action_Pairwise "Action_Pairwise":
        _Action_Pairwise() 
        #~_Action_Pairwise() 
        static _DispatchObject * Alloc() 
        static void Help() 
