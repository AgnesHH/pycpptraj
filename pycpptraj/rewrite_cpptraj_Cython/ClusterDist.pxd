# distutil: language = c++

from libcpp.vector cimport vector

cdef extern from "ClusterDist.h":
    ctypedef vector[int] Cframe
    cdef cppclass ClusterDist:
        pass
        #typedef vector[int] Cframe
