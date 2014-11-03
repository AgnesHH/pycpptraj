# distutil: language = c++

from Action cimport *

cdef extern from "Action_Angle.h":
    cdef cppclass Action_Angle:
        Action_Angle()
        DispatchObject* Alloc()
        void Help()
