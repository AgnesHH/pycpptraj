from pycpptraj.base import *
from pycpptraj.DataSet_Coords_TRJ import DataSet_Coords_TRJ as TRAJ

traj = TRAJ()
print dir(traj)
print traj.top.is_empty()
traj.top = Topology("data/Tc5b.top")

traj.load("./data/md1_prod.Tc5b.x")

print traj.data_format
print traj.data_type
print traj.is_torsion_array()
print traj.is_empty()
print traj.ndim
print traj.idx

frame = traj.allocate_frame()
print frame.n_atoms
print frame.size
print frame.is_empty()
print frame

#traj.add_frame(frame)
print frame[0]
traj.get_frame(0, frame)
print frame[0]
#traj.get_frame(1, frame)
#print frame[0]
