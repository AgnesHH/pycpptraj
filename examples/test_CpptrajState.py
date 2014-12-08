import os
from pycpptraj.Topology import Topology
from pycpptraj.Frame import Frame
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ArgList import ArgList
from pycpptraj.FileName import FileName
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.Trajin import Trajin
from pycpptraj.TrajinList import TrajinList
from pycpptraj.ReferenceFrame import ReferenceFrame

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
trajoutname = datadir + "test.x"
refname = "./data/Tc5b.nat.crd"
trajinname = datadir + "md1_prod.Tc5b.x"
toplist = TopologyList()
toplist.AddParmFile(datadir + "Tc5b.top")
top = toplist[0]

#creat TrajinList instance
trajininput= """
trajin ./data/md1_prod.Tc5b.x
"""
argIn = ArgList(trajininput)
#trajlist = TrajinList()
#trajlist.AddTrajin("./data/md1_prod.Tc5b.x", argIn, toplist)
#print trajlist.mode()
#print trajlist.max_frames
#end TrajinList

state = CpptrajState()
#state.AddTrajin(argIn)
#state.AddTrajin(trajinname)
#state.Run()
#state.RunAnalyses()

# test refFrame
refFrame = ReferenceFrame()
refFrame.LoadRef("./data/Tc5b.nat.crd", top, 0)
topref = refFrame.Parm()
crd = refFrame.Coord()
print crd.size/3
topref.SetReferenceCoords( refFrame.Coord()  )
topref.PrintResidueInfo(":2-5")
