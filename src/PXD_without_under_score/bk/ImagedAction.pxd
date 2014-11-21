# distutils: language = c++
from DistRoutines cimport *


cdef extern from "ImagedAction.h": 
    cdef cppclass ImagedAction "ImagedAction":
        ImagedAction() : imageType_(NOIMAGE ), useImage_(false)
        void InitImaging(bint imageIn)
        void SetupImaging(BoxType parmboxtype)
        bint ImagingEnabled() const 
        bint UseImage() const 
        ImagingType ImageType() const 
