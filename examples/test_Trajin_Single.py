import os
import numpy as np
from pycpptraj.Frame import Frame
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology
from pycpptraj.ReferenceFrame import ReferenceFrame

#from pycpptraj.Trajin_Single

ts = Trajin_Single()

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
refname = "./data/Tc5b.nat.crd"
#mdx = datadir + "Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"

top = Topology(fname=topname)
#print top

trajin = """
"""

#arglist = ArgList(trajin)
#print arglist

ts.setup_traj_read(mdx, ArgList(), top, checkBox=True)
#ts.start()
#ts.begin_traj()
#ts.is_ensemble()
#frame = Frame()
#print ts.has_velocity()
#ts.IsEnsemble()
#print ts.ReadTrajFrame(10, frame)
#print frame
#print ts.total_frames
#print ts.total_read_frames
#ts.print_frame_info()
#print
#print ts.has_velocity()
#print ts.nreplica_dimension()
#print "current frame:", ts.current_frame
ts.prepare_for_read(True)
frame = Frame()
frame.setup_frame_v(top, ts.has_velocity(), ts.nreplica_dimension())
frame2 = Frame(frame)

# load reference
ref = ReferenceFrame()
ref.load_ref(refname, top)
ref_frame = ref.coord()
xyz = ref_frame.xyz()
xyznp = np.asarray(xyz)
print xyznp[:3]
print xyznp[3:6]

ts.begin_traj(False)
#ts.get_next_frame(frame)
#xyz = frame.xyz()
#print xyz

#for i in range(10):
#    ts.get_next_frame(frame)
#    print frame.rmsd(ref_frame)
ts.end_traj()
