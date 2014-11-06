# distutils: language = c++

cdef extern from "CpptrajState.h":
    cdef cppclass _CpptrajState "CpptrajState":
        pass
