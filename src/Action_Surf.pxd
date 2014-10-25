cdef extern from "Action_Surf.h":
    cdef cppclass Action_Surf:
        Action_Surf()
        DispatchObject* Alloc()
        void Help()
