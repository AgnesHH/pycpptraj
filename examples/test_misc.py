import numpy as np
from rmsd import rmsd
from pycpptraj.Frame import Frame
from pycpptraj.base import *
from pycpptraj.TrajinList import TrajinList
from pycpptraj.misc import strip

farray = FrameArray()
traj = Trajectory()
traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))
farray.get_frames(traj, update_top=True)

strip(farray.top, farray, mask="!@CA")

print farray.top.n_atoms
farray.top.summary()

arr_0 = np.asarray(farray[0].coords).reshape(farray[0].size/3, 3)
arr_1 = farray[0].np_coords_reshape

anp = np.zeros(100*100).reshape(100, 100)
for i in range(100):
    for j in range(100):
        anp[i, j] = farray[i].rmsd(farray[j])
print anp
