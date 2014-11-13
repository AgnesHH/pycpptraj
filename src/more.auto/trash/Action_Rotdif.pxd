# distutils: language = c++
from Action cimport *
from Random cimport *
from DataSet_Vector cimport *


cdef extern from "Action_Rotdif.h": 
    cdef cpplass _Action_Rotdif "Action_Rotdif":
        _Action_Rotdif() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Rotdif() 
