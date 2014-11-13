# distutils: language = c++

from ImageTypes cimport *

cdef Mode m = BYRES

print m

mystring = ModeString(m)
print type(mystring)
