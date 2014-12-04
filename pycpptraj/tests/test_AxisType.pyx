# distutils: language = c++

from AxisType cimport *

cdef _NA_Base * p = new _NA_Base()

del p
