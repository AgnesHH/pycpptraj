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
