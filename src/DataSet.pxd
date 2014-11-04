# distutil: language = c++

cdef extern from "DataSet.h":
    cdef cppclass _DataSet "DataSet":
        pass
