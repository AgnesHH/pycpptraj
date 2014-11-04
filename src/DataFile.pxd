# distutil: language = c++

cdef extern from "DataFile.h":
    cdef cppclass _DataFile "DataFile":
        pass
