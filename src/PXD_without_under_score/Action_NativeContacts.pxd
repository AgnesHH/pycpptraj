# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from DataSet_MatrixDbl cimport *


cdef extern from "Action_NativeContacts.h": 
    cdef cppclass Action_NativeContacts "Action_NativeContacts":
        Action_NativeContacts() 
        DispatchObject * Alloc() 
        void Help() 
