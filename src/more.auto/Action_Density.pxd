# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from OnlineVarT cimport *


cdef extern from "Action_Density.h": 
    cdef cppclass _Action_Density "Action_Density":
        _Action_Density() 
        static _DispatchObject * Alloc() 
        static void Help() 
