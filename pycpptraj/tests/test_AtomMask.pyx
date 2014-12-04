# distutils: language = c++

from AtomMask cimport *

cdef _AtomMask* p = new _AtomMask()

p.MaskInfo()
p.BriefMaskInfo()
print
del p
