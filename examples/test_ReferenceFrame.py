import os
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.FileName import FileName

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
fname = "./data/Tc5b.nat.crd"

top = Topology(topname)
#top.summary()
ref = ReferenceFrame()
ref.load_ref(fname, top)
top2 = ref.top
top2.summary()
refframe = ref.frame
#print help(refframe)

#print frame.rmsd(refframe)
