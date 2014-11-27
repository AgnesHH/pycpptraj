from Topology import Topology
from FileName import FileName

top1 = Topology()

fname="./test_PyCpptraj/Tc5b.ff99SB_JSC.mb3.newHmass.dt4fs.top"
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
