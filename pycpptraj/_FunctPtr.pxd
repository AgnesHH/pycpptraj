# distutils: language = c++
from pycpptraj.DispatchObject cimport DispatchAllocatorType 
from pycpptraj.BaseIOtype cimport AllocatorType
from pycpptraj.trajs.Trajin cimport _Trajin

# dummy class to hold function pointer
cdef class FunctPtr:
    cdef DispatchAllocatorType ptr
    # used for BaseIOtype
    cdef AllocatorType allocptr
    cdef _Trajin* trajinptr
