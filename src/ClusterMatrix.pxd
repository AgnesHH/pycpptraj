# distutil: language = c++

cdef extern from "ClusterMatrix.h":
    cdef cppclass ClusterMatrix:
        ClusterMatrix()
        #int SetupWithSieve(size_t, size_t, int)
        #not done yet
