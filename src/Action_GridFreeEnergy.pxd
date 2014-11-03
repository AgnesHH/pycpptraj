# distutil: language = c++

cdef extern from "Action_GridFreeEnergy.h":
    cdef cppclass _Action_GridFreeEnergy "Action_GridFreeEnergy":
        Action_GridFreeEnergy()
        DispatchObject* Alloc()
        void Help()
