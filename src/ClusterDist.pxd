# distutil: language = c++

from libcpp.vector cimport vector

cdef extern from "ClusterDist.h":
    ctypedef Cframes "ClusterDist::Cframes"
    cdef cppclass ClusterDist:
        pass
