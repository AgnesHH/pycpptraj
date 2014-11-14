#distutils: language = c++
from Action cimport *

cdef extern from "Action_DSSP.h":
    cdef cppclass _Action_DSSP "Action_DSSP":
        _Action_DSSP()
        void Help()


