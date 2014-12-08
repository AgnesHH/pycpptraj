import os
from pycpptraj.ArgList import ArgList
from pycpptraj.FrameList import FrameList
from pycpptraj.TopologyList import TopologyList 

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
toplist = TopologyList()
toplist.AddParmFile("./data/Tc5b.top")
arglist = ArgList("ref ./data/md1_prod.Tc5b.x refindex 1")
#toplist.info()

mylist = FrameList()
mylist.help()
mylist.AddRefFrame(arglist, toplist)
#print mylist.info
