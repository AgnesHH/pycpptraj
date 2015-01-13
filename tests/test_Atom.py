from pycpptraj.Atom import Atom
from pycpptraj.base import *

at = Atom()

#print help(at)
print at
print at.atomic_number

top = Topology("./data/HP36.top")
a0 = top.atomlist[0]
print a0
print a0.element
print len(a0.element_short_name)
print a0.atomic_number
print dir(a0)
print a0.get_bond_length(1, 7)
print a0.molnum
print a0.nbonds
print a0.typeindex
#print dir(a0.atype)
