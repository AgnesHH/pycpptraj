# distutil: language = c++

from ArrayIterator cimport *

cdef extern from "Grid.h":
    cdef template[T]:
        cdef cppclass _Grid "Grid":
            pass
