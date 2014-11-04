# distutil: language = c++

cdef extern from "DataSetList.h":
    cdef cppclass _DataSetList "DataSetList":
        pass
