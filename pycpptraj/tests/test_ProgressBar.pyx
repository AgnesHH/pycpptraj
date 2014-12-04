# distutils: language = c++

from ProgressBar cimport *

cdef _ParallelProgress* p = new _ParallelProgress()
del p
