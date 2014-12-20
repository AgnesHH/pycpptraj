# distutil: language = c++

from DistRoutines cimport *

cdef extern from "ImagedAction.h":
    cdef cppclass _ImagedAction "ImagedAction":
        _ImagedAction()
        void InitImaging(bint)
        void SetupImaging(BoxType)
        bint ImagingEnabled(self)
        bint UseImage()
        ImageType()

cdef class ImagedAction:
    cdef _ImagedAction* thisptr
