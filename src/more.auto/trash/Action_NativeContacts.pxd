# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from DataSet_MatrixDbl cimport *


cdef extern from "Action_NativeContacts.h": 
    cdef cpplass _Action_NativeContacts "Action_NativeContacts":
        _Action_NativeContacts() 
        static _DispatchObject * Alloc() 
        static void Help() 
