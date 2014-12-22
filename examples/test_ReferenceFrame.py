import os
from pycpptraj.AtomMask import AtomMask
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.FileName import FileName
from pycpptraj.Frame import Frame
from pycpptraj.CpptrajState import CpptrajState

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
fname = "./data/Tc5b.nat.crd"

top = Topology(topname)
#top.summary()
ref = ReferenceFrame()
ref.load_ref(fname, top)
#top2 = ref.top
#top2.summary()
refframe = ref.frame

# 
top.set_reference_coords(refframe)
top.summary()
print top.setup_integer_mask(AtomMask(":1-20@CA"))

# 
state = CpptrajState()
print state.traj_length(topname, ["./data/md1_prod.Tc5b.x", ])
