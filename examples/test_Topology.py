import os
from pycpptraj.Topology import Topology
from pycpptraj.FileName import FileName

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
fname = datadir + "Tc5b.top"
top = Topology(fname=fname)

top.Summary()

print "test atom_iterator"
for atom in top.atom_generator():
    pass

print "test res_iterator"
for res in top.res_generator():
    pass

print "test mol_iterator"
for mol in top.mol_generator():
    pass

# test empty file
top2 = Topology()
top2.Summary()
