from cython.operator cimport dereference as deref
import numpy as np
cimport numpy as np

cdef struct matrix:
    double x
    int y
    double[:] z

def get_struct():
    cdef matrix  s
    s.x = 1.
    s.y = 2
    s.z = np.array([1., 2.])
    print s.z
