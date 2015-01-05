from pycpptraj.base import *
from pycpptraj.FrameArray2 import FrameArray2

traj = FrameArray2()
traj2 = FrameArray2()
print dir(traj)
print traj.top.is_empty()
traj.top = Topology("data/Tc5b.top")
traj2.top = Topology("data/Tc5b.top")

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

frame0 = traj[0]
assert frame0.coords_copy() == frame.coords_copy()

# make sure that frame and frame0 are copies. Changing frame0 does not affact frame
frame0[10] = 10000.
assert frame0.coords_copy() != frame.coords_copy()
#traj.get_frame(1, frame)
#print frame[0]
