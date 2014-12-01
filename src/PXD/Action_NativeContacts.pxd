# distutils: language = c++
from Action cimport *
from ImagedAction cimport *
from DataSet_MatrixDbl cimport *


cdef extern from "Action_NativeContacts.h": 
    cdef cppclass _Action_NativeContacts "Action_NativeContacts":
        _Action_NativeContacts() 
        _DispatchObject * Alloc() 
        void Help() 
