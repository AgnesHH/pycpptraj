# distutils: language = c++

from NetcdfFile cimport *

cdef _NetcdfFile* p = new _NetcdfFile()

fname = "../../examples/data/md1_prod.x"
p.NC_openRead(fname)
#print p.Ncid()
#print p.Ncatom()
#print p.Ncatom3()
#p.NC_close()
del p
