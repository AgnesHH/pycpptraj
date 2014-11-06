# distutil: language = c++

cdef extern from "DispatchObject.h":
    ctypedef DispatchAllocatorType "DispatchObject::DispatchAllocatorType"
    cdef cppclass _DispatchObject "DispatchObject":
        pass
