# distutils: language = c++

from AnalysisList cimport *

cdef _AnalysisList* p = new _AnalysisList()

del p
