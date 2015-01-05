from pycpptraj.base import *
from time import time

traj = Trajectory()
top = Topology("data/Tc5b.top")
traj.load("data/md1_prod.Tc5b.x", top)
print traj.max_frames
farray = FrameArray()

t0 = time()
for frame in traj:
    farray.append(frame)

print time() - t0
print farray.size
