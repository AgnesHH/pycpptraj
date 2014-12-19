import os
from pycpptraj.TopologyList import TopologyList 
from pycpptraj.Topology import Topology

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
tl = TopologyList()
tl.add_parm_file(datadir + "Tc5b.top")
tl.add_parm_file(datadir + "HP36.top")
tl.info()
#
t = tl[1]
t.summary()
t.atom_info("@CA")
#
##tl.clear()
#print tl
#print t2.GB_radiiset
#
#print t2.n_repdim

#print t2.original_filename()
#t2.residue_info(":1-4, 20")
#print
#t2.residue_info("@CG")

#atom1 = t.atom_generator()
#atom2 = t.atom_generator()
#print atom1 == atom2
#print atom1, atom2
