from pycpptraj.ParmFile import ParmFile
from pycpptraj.Topology import Topology

top = Topology()
parm = ParmFile()

fname = "./Tc5b.top"

print "Read topology file and dump to 'top'"
parm.read_topology(top, fname, 1)
print top.n_atoms
print "Summary:"
top.summary()

print "\natom_iterator for top"
for atom in top.atom_generator():
    pass
    #print atom

print "\nres_iterator for top"
for res in top.res_generator():
    pass
    #print res

print "\nmol_iterator for top"
for mol in top.mol_generator():
    pass
    #print mol

for i in range(304):
    top.atom_mask_name(i)

#print "\nAtom info"
#top.PrintAtomInfo("@CA")
#top.PrintBondInfo("@C*")
pfname = parm.parm_filename()
print pfname.full()
