# distutils: language = c++
from Action cimport *
from ImageTypes cimport *


cdef extern from "Action_Image.h": 
    cdef cppclass Action_Image "Action_Image":
        Action_Image() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Image() 
