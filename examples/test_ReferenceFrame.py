import os
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.FileName import FileName

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
fname = datadir + "Tc5b.Tc5b.nat.crd"

top = Topology(fname=topname)
#top.Summary()
ref = ReferenceFrame()
top2 = ref.Parm()
#ref.LoadRef(fname, top, 0)
