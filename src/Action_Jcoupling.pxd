# distutil: language = c++

from Action cimport *

cdef extern from "Action_Jcoupling.h":
    cdef cppclass Action_Jcoupling:
        Action_Jcoupling()
        DispatchObject* Alloc()
        void Help()
