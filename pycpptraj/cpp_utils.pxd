# this file has several c++ methods
# usage: from pycpptraj.cpp_utils cimport your_desired_code

cdef extern from "<std>" namespace "<std>" nogil:
    vector[T] reverse(vector[T].begin(), vector[T].end())
