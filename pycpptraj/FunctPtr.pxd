# distutils: language = c++
from DispatchObject cimport DispatchAllocatorType

# dummy class to hold function pointer
cdef class FunctPtr:
    cdef DispatchAllocatorType ptr
