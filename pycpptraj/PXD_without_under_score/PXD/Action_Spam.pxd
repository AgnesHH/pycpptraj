# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from ImagedAction cimport *
from Vec3 cimport *


cdef extern from "Action_Spam.h": 
    cdef cppclass Action_Spam "Action_Spam":
        Action_Spam() 
        DispatchObject * Alloc() 
        void Help() 
