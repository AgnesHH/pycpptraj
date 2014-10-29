# distutil: language = c++

from ClusterDist cimport *

cdef extern from "ClusterNode.h":
    cdef cppclass ClusterNode:
        ClusterNode()
        ClusterNode(ClusterNode*, ClusterDist.Cframce&, int )
        ClusterNode(ClusterNode&)

        #operator
        #end operator

