#distutils: language = c++

cdef extern from "Action_DSSP.h":
    cdef cppclass Action_DSSP:
        Action_DSSP()
        void Help()


