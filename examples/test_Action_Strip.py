from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions import Action

farray = FrameArray(Topology("./data/Tc5b.top"))

print "newtop"
newtop = farray.top.copy()

trajin = Trajectory()
trajin.load("./data/md1_prod.Tc5b.x", newtop)
print trajin.max_frames
farray.get_frames(trajin)
print farray.size

toplist = TopologyList()
toplist.add_parm(newtop)
dslist = DataSetList()
dflist = DataFileList()

stripact = Action_Strip()
stripact.read_input(ArgList("strip !@CA"), toplist)
stripact.process(toplist[0], newtop)
print "toplist"
print toplist[0].n_atoms
print "end toplist"

print 
farray2 = FrameArray()
print "before stripping farray2 size = %s" % (farray2.size)

for i in range(10):
    stripact.do_action_2(farray[i], farray2)
print "after stripact: farray2"
print farray2.size
print farray2[0].coords
farray2.top.summary()
farray2.top = newtop.copy()
farray2.top.summary()
