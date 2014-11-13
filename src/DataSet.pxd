# distutil: language = c++
from Dimension cimport *

cdef extern from "DataSet.h":
    cdef cppclass _DataSet "DataSet":
        pass
