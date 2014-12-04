# distutil: language = c++

cdef extern from "BaseIOtype.h":
    ctypedef _BaseIOtype* (*AllocatorType)()
    ctypedef void (*HelpType)()
    cdef cppclass _BaseIOtype "BaseIOtype":
        pass

cdef class BaseIOtype:
    cdef _BaseIOtype* thisptr
