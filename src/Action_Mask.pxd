# distutil: language = c++

from Action cimport *
from TrajectoryFile cimport *

cdef extern from "Action_Mask.h":
    cdef cppclass _Action_Mask "Action_Mask":
        Action_Mask()
        DispatchObject* Alloc()
        void Help()

#what should I do here?

