# distutil: language = c++

from Action cimport *
cdef extern from "Action_Gist.h":
    cdef cppclass _Action_Gist "Action_Gist":
        _Action_Gist()
        _DispatchObject* Alloc()
        void Help()
