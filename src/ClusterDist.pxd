# distutil: language = c++

from libcpp.vector cimport vector

cdef extern from "ClusterDist.h":
    cdef cppclass ClusterDist:
        typedef vector[int] Cframes
