"""calculate pairwise rmsd for trajectory"""

import inspect
import numpy as np
from pycpptraj.base import *
from pycpptraj.misc import strip, iterload

top=Topology("./data/Tc5b.top")

farray = FrameArray()
traj = Trajectory()
print traj
traj.load("./data/md1_prod.Tc5b.x", Topology("./data/Tc5b.top"))
farray.get_frames(traj, update_top=True)

strip(farray, mask="!@CA")

def test_1(self):
    anp = np.zeros(100*100).reshape(100, 100)
    for i in range(100):
        for j in range(100):
            anp[i, j] = farray[i].rmsd(farray[j])
    print anp

genobj = iterload(top=top, traj="./data/md1_prod.Tc5b.x")
print genobj.next()

i = 0
for range in genobj:
    i += 1
print i

farray_gen = iterload(top=top, traj="./data/md1_prod.Tc5b.x", chunk=50)
print  farray_gen.next()
