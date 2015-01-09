# distutils: language = c++
from pycpptraj.DispatchObject cimport DispatchAllocatorType 
from pycpptraj.BaseIOtype cimport AllocatorType

# dummy class to hold function pointer
cdef class FunctPtr:
    cdef DispatchAllocatorType ptr
    # used for BaseIOtype
    cdef AllocatorType allocptr
