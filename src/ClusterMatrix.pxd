# distutil: language = c++

cdef extern from "ClusterMatrix.h":
    cdef cppclass _ClusterMatrix "ClusterMatrix":
        _ClusterMatrix()
        int SetupWithSieve(size_t, size_t, int)
        _ClusterMatrix(const _ClusterMatrix&)
        int SaveFile(const string&) 
        int LoadFile(const string&, int)
        int SetupMatrix(size_t)

