# distutils: language = c++
from libcpp.string cimport string
from ArgList cimport *
from Topology cimport *
from CpptrajFile cimport *
from BaseIOtype cimport *


cdef extern from "ParmIO.h": 
    cdef cppclass ParmIO "ParmIO":
