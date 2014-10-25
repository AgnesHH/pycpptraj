cdef extern from "Box.h":
    cdef cppclass Box:
        #enum BoxType: NOBOX=0, ORTHO, TRUNCOCT, RHOMBIC, NONORTHO
        Box()
        Box(const double*)
        Box(const Box&)
