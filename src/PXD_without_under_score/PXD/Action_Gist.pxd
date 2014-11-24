# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from Vec3 cimport *
from Matrix_3x3 cimport *
from ImagedAction cimport *
from Timer cimport *


cdef extern from "Action_Gist.h": 
    cdef cppclass Action_Gist "Action_Gist":
        Action_Gist() 
        DispatchObject * Alloc() 
        void Help() 
