# distutils: language = c++

from NetcdfFile cimport *

cdef _NetcdfFile* p = new _NetcdfFile()

fname = "../test_PyCpptraj/Tc5b.ff99SB_JSC.mb3.newHmass.dt4fs.top"
p.NC_openRead(fname)
print p.Ncid()
print p.Ncatom()
print p.Ncatom3()
del p
