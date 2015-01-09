from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions import Action
from pycpptraj.misc import strip
from pycpptraj.Trajin_Single import Trajin_Single

print dir(Action_Strip())

farray = FrameArray(top=Topology("./data/Tc5b.top"), fname='data/md1_prod.Tc5b.x')

print "newtop"
newtop = farray.top.copy()
newtop2 = newtop.copy()
trajin = Trajectory()

toplist = TopologyList()
toplist.add_parm(newtop)
dslist = DataSetList()
dflist = DataFileList()
#
stripact = Action_Strip()
stripact.read_input(ArgList("strip !@CA"), toplist)
stripact.process(toplist[0], newtop=newtop)
stripact.do_action(0, farray[0])
print farray[0].n_atoms
#print "toplist"
#print "toplist[0].n_atom ", toplist[0].n_atoms
#print "end toplist"
#print "newtop.n_atoms", newtop.n_atoms
#newtop.summary()

print farray[0].size
strip(farray, "!@CA")
print farray.top.n_atoms
print "After stripping, farray2.top"
farray.top.summary()

newtop2 = strip(farray2.top, "!@CA")
print "After stripping, newtop2"
newtop2.summary()

print "test Frame.strip_atoms"
for i in range(farray2.size):
    # this method is too slow vs cpptraj
    tmp = farray2[i]
    tmp.strip_atoms(farray2.top.copy(), "!@CA")
    farray2[i] = tmp

