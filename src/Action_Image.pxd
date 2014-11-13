# distutils: language = c++
from Action cimport *
from ImageTypes cimport *


cdef extern from "Action_Image.h": 
    cdef cppclass _Action_Image "Action_Image":
        _Action_Image() 
        static _DispatchObject * Alloc() 
        static void Help() 
        #~_Action_Image() 
