import os
import numpy as np
from pycpptraj.Frame import Frame
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Trajin import Trajin
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology
from pycpptraj.ReferenceFrame import ReferenceFrame

ts = Trajin_Single()
basetraj = Trajin()
datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
refname = "./data/Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"
ts = Trajin_Single()

top = Topology(topname)
trajin = """
"""

ts.load(mdx, ArgList(), top)
ts.prepare_for_read(True)
frame = Frame()
frame.set_frame_v(top, ts.has_velocity(), ts.nreplica_dimension())
frame2 = Frame(frame)

# load reference
ref = ReferenceFrame()
ref.load_ref(refname, top)
ref_frame = ref.frame

ts.begin_traj(False)
for i in range(10):
    ts.get_next_frame(frame)
    print frame.rmsd(ref_frame)
ts.end_traj()


print "test basetraj"
#basetraj.load(mdx, ArgList(), top)

print "Test_Action_Rmsd"
armsd = Action_Rmsd()
armsd.init(arglist, TopologyList(), )
