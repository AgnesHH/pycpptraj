# distutils: language = c++
from DistRoutines cimport *


cdef extern from "ImagedAction.h": 
    cdef cppclass ImagedAction "ImagedAction":
        ImagedAction() 
        void InitImaging(bint imageIn)
        void SetupImaging(BoxType parmboxtype)
        bint ImagingEnabled() const 
        bint UseImage() const 
        ImagingType ImageType() const 
