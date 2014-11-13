# distutils: language = c++
from Action cimport *
from ImageTypes cimport *


cdef extern from "Action_Image.h": 
    cdef cppclass _Action_Image "Action_Image":
        _Action_Image() 
        _DispatchObject * Alloc() 
        void Help() 
        #~_Action_Image() 
