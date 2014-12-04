# distutils: language = c++

from Dimension cimport *

cdef _Dimension* p = new _Dimension()
cdef DimIdxType id = Y
print "(enum)DimIdxType::Y = %d " % id

p.SetLabel("my label")
p.SetMin(12)
p.SetMax(100)
p.SetStep(4)
p.SetBins(100)

print p.Label()
print p.Min()
print p.Max()
print p.Bins()
print p.MinIsSet()
print p.MaxIsSet()

print p.Coord(100)
print p.CalcBinsOrStep()
p.PrintDim()
del p
