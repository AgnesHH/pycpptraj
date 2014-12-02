# distutil: language = c++
from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr
from libcpp.vector cimport vector

# Cython does not support yet
# (can not convert self.thisptr.Dptr() to "double* ptr"
def _to_list(self, N):
    """convert array pointer to list of elements"""
    cdef double* ptr = self.thisptr.Dptr()
    cdef int i
    cdef vector[double] v
    for i in range(N):
        v.push_back(deref(ptr))
        incr(ptr)
    # Cython will convert vector to list
    return v


