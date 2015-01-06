"""calculate pairwise rmsd for trajectory"""

import numpy as np
from pycpptraj.base import *
from pycpptraj.misc import strip

farray = FrameArray()
traj = Trajectory()
traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))
farray.get_frames(traj, update_top=True)

strip(farray, mask="!@CA")

anp = np.zeros(100*100).reshape(100, 100)
for i in range(100):
    for j in range(100):
        anp[i, j] = farray[i].rmsd(farray[j])
print anp
