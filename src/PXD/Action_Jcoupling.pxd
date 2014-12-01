# distutil: language = c++

from Action cimport *

cdef extern from "Action_Jcoupling.h":
    cdef cppclass _Action_Jcoupling "Action_Jcoupling":
        _Action_Jcoupling()
        _DispatchObject* Alloc()
        void Help()
