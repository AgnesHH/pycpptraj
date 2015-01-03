from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions import Action
from pycpptraj.misc import strip

farray = FrameArray(Topology("./data/Tc5b.top"))

print "newtop"
newtop = farray.top.copy()
newtop2 = newtop.copy()
trajin = Trajectory()
trajin.load("./data/md1_prod.Tc5b.x", newtop)
print trajin.max_frames
farray.get_frames(trajin)
farray2 = farray.copy()
print 'farray.size: ', farray.size
print "farray[0].xyz(0)", farray[0].xyz(0)
print 'farray2.size: ', farray2.size

#toplist = TopologyList()
#toplist.add_parm(newtop)
#dslist = DataSetList()
#dflist = DataFileList()
#
#stripact = Action_Strip()
#stripact.read_input(ArgList("strip !@CA"), toplist)
#stripact.process(toplist[0], newtop)
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

