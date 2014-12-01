# distutil: language = c++

cdef extern from "DihedralSearch.h":
    cdef cppclass _DihedralSearch "DihedralSearch":
        pass


