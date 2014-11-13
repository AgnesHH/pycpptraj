# distutils: language = c++

from Analysis_MeltCurve cimport *

cdef _Analysis_MeltCurve* p = new _Analysis_MeltCurve()
p.Help()
p.Analyze()
del p
