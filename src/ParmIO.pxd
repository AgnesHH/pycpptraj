# distutils: language = c++
from "ArgList cimport *
from "Topology cimport *
from "CpptrajFile cimport *
from "BaseIOtype cimport *


cdef extern from "ParmIO.h": 
    cdef cpplass _ParmIO "ParmIO":
        pass
