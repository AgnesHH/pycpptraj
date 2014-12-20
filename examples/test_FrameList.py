import os
from pycpptraj.ArgList import ArgList
from pycpptraj.Frame import Frame
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FrameList import FrameList
from pycpptraj.TopologyList import TopologyList 

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
toplist = TopologyList()
toplist.add_parm_file("./data/Tc5b.top")
arglist = ArgList("./data/Tc5b.nat.crd")
toplist.info()

mylist = FrameList()
mylist.add_ref_frame(arglist, toplist)
aref = mylist.get_active_reference()
mylist.list()
print mylist.n_frames

print aref.xyz(0)
