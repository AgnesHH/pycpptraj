# distutil: language = c++

cdef extern from "Matrix.h":
    cdef cppclass Matrix[T]:
        pass

