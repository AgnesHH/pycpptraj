# distutils: language = c++
from DispatchObject cimport DispatchAllocatorType
#from actions.Action import Action, _Action

# dummy class to hold function pointer
cdef class FunctPtr:
    cdef DispatchAllocatorType ptr
