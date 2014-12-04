from pycpptraj.ParmFile import ParmFile
from pycpptraj.Topology import Topology

top = Topology()
parm = ParmFile()

fname = "./Tc5b.top"

print "Read topology file and dump to 'top'"
parm.ReadTopology(top, fname, 1)
print top.Natom
print "Summary:"
top.Summary()

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
    top.AtomMaskName(i)

#print "\nAtom info"
#top.PrintAtomInfo("@CA")
#top.PrintBondInfo("@C*")
top.PrintChargeMassInfo("@CA", 2)
pfname = parm.ParmFilename()
print pfname.full()
