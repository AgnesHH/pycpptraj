import os
from pycpptraj.TopologyList import TopologyList 

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
tl = TopologyList()
tl.AddParmFile(datadir + "Tc5b.top")
tl.AddParmFile(datadir + "HP36.top")
tl.List()

t = tl.GetParm(1)
t.Summary()
#t.PrintAtomInfo("@CA")

t2 = tl[1]
print t == t2
t2.Summary()

print t2.GBradiiSet

print t2.NrepDim

print t2.OriginalFilename()
t2.PrintResidueInfo(":1-4, 20")
print
t2.PrintResidueInfo("@CG")

atom1 = t.atom_generator()
atom2 = t.atom_generator()
print atom1 == atom2
print atom1, atom2
