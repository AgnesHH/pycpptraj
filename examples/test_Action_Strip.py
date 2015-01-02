from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions import Action
from pycpptraj.misc import strip

farray = FrameArray(Topology("./data/Tc5b.top"))

print "newtop"
newtop = farray.top.copy()
trajin = Trajectory()
trajin.load("./data/md1_prod.Tc5b.x", newtop)
print trajin.max_frames
farray.get_frames(trajin)
print farray.size
print "farray[0].xyz(0)", farray[0].xyz(0)

toplist = TopologyList()
toplist.add_parm(newtop)
dslist = DataSetList()
dflist = DataFileList()

stripact = Action_Strip()
stripact.read_input(ArgList("strip !@CA"), toplist)
stripact.process(toplist[0], newtop)
print "toplist"
print "toplist[0].n_atom ", toplist[0].n_atoms
print "end toplist"

print 
farray2 = FrameArray()
print "before stripping farray2 size = %s" % (farray2.size)

for i in range(10):
    stripact.do_action_2(farray[i], farray2)
print "after stripact: farray2"
print farray2.size
#print farray2[0].coords
farray2.top = newtop.copy()

print
newtop2 = farray.top.copy()
print newtop2
print "newtop2.n_atoms = ", newtop2.n_atoms
print farray[0].coords[:3]
strip(newtop2.copy(), farray, "!@CA")
print farray[0].coords[:3]

#print farray[0].coords
print "newtop2.n_atoms = ", newtop2.n_atoms
print farray.top.n_atoms
