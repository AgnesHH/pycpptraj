# distutils: language = c++
import numpy as np
cimport numpy as np
from Matrix_3x3 cimport *
from Vec3 cimport *
from time import time

cdef double[:] m1np = np.array([1.,2.,3.,4.,5.,6.,7.,8.,9.])
cdef double[:] m2np = np.array([9.,8.,7.,6.,5.,4.,3.,2.,1.])

cdef:
    _Matrix_3x3* m1  = new _Matrix_3x3(&m1np[0])
    _Matrix_3x3* m2  = new _Matrix_3x3(&m2np[0])
    _Matrix_3x3* m3  = new _Matrix_3x3()
    
m1.Print("m1")
m2.Print("m2")

t0 = time()
m3[0] = m1[0] * m2[0]
print "time = %1.10f " % (time() - t0)
m3.Print("m3")
del m1, m2, m3

cdef _Vec3 vec = _Vec3(1.,2.,3.)
cdef _Vec3 vec2 

vec2 = m1.TransposeMult(vec)
vec2.Print("vec2 for TransposeMult")

