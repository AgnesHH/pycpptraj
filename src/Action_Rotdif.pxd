# distutils: language = c++
from Action cimport *
from Random cimport *
from DataSet_Vector cimport *


cdef extern from "Action_Rotdif.h": 
    cdef cppclass _Action_Rotdif "Action_Rotdif":
        _Action_Rotdif() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Rotdif() 
