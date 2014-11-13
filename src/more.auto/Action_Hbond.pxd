# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from DataSet_integer cimport *


cdef extern from "Action_Hbond.h": 
    cdef cppclass _Action_Hbond "Action_Hbond":
        _Action_Hbond() 
        static _DispatchObject * Alloc() 
        static void Help() 
