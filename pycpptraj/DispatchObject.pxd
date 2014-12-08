# distutil: language = c++

ctypedef _DispatchObject* (*DispatchAllocatorType)()
cdef extern from "DispatchObject.h":
    #ctypedef _DispatchObject* (*DispatchAllocatorType)()
    cdef cppclass _DispatchObject "DispatchObject":
        pass
