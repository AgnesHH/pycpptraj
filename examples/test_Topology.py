import os
from pycpptraj.Topology import Topology
from pycpptraj.FileName import FileName

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
top1 = Topology()

fname = datadir + "Tc5b.top"
f = FileName(fname)

top1.SetParmName("top1", f)
print top1.ParmName
top1.Summary()

print "test atom_iterator"
for atom in top1.atom_generator():
    pass

print "test res_iterator"
for res in top1.res_generator():
    pass

print "test mol_iterator"
for mol in top1.mol_generator():
    pass
