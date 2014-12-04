# distutils: language = c++
from libcpp.vector cimport vector
from ParameterTypes cimport ptype

cdef vector[ptype*] convert_list_to_vector(list listin)
