from pycpptraj.base import *
from pycpptraj.DataSet_Coords_TRJ import DataSet_Coords_TRJ as TRAJ

traj = TRAJ()
traj.top = Topology("data/Tc5b.top")
#traj.top.summary()

#traj.add_single_trajin("./data/md1_prod.Tc5b.x", ArgList("1 100 2"), Topology("data/Tc5b.top"))

#frame = Frame()
#traj.get_frame(10, frame)
