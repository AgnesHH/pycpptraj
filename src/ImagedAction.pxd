# distutil: language = c++

from DistRoutines cimport *

cdef extern from "ImagedAction.h":
    cdef cppclass ImagedAction:
        ImagedAction()
        void InitImaging(bint)
        void SetupImaging(BoxType)
        bint ImagingEnabled(self)
        bint UseImage()
        ImageType()
