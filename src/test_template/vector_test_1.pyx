# distutils: language = c++

from libcpp.string cimport string
from libcpp.vector cimport vector

cdef vector[int] vect = xrange(1, 10, 2)
print(vect)              # [1, 3, 5, 7, 9]

cdef vector[string] cpp_strings = b'ab cd ef gh'.split()
print(cpp_strings[1])   # b'cd'
