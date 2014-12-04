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
