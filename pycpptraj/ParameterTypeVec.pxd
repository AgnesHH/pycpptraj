# distutils: language = c++

from libcpp.vector cimport vector
from cython.operator cimport dereference as deref, preincrement as incr
# convert cpptraj vector to python list and Python list to cpptraj vector

# use fused type
from ParameterTypes cimport ptype
from ParameterTypes cimport BondParmType, BondType
from ParameterTypes cimport _BondParmType, _BondType
from ParameterTypeVec cimport ParameterTypeVec

cdef class ParameterTypeVec:
    # use (void*) pointer to cast to different vector type
    cdef public BondParmType bondparmtype
    cdef public BondType bondtype
