# distutils: language = c++


cdef extern from "FileIO.h": 
    cdef cppclass FileIO "FileIO":
        pass
