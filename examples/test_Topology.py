import os
from pycpptraj.Topology import Topology
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FileName import FileName

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
fname = "./data/Tc5b.top"

top = Topology(fname)
top2 = top.modifyStateByMask(AtomMask("!@CA"))

top.summary()
top.atom_info("@CA")

#print "test atom_iterator"
#for atom in top.atom_generator():
#    pass
#
#print "test res_iterator"
#for res in top.res_generator():
#    pass
#
#print "test mol_iterator"
#for mol in top.mol_generator():
#    pass

#top.print_atom_info("@CA")

# dummy test for modify top
# test empty file
#top2 = Topology()
#top2.summary()
