# distutils: language = c++

from NetcdfFile cimport *

cdef _NetcdfFile* p = new _NetcdfFile()

del p
