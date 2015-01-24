import numpy as np
from pycpptraj.base import *
from time import time

TRAJ = TrajReadOnly()
TRAJ.top = Topology("./data/Tc5b.top")
TRAJ.load("./data/md1_prod.Tc5b.x")

def calc_pairwise_rmsd():
    farray = FrameArray()
    farray.top = TRAJ.top
    #
    for frame in TRAJ:
        frame.strip_atoms("!@CA", TRAJ.top.copy())
        farray.append(frame)
    
    size = farray.size
    arr = np.empty(shape=(size, size))
    #
    t0 = time()
    for i, framei in enumerate(farray):
        for j, framej in enumerate(farray):
            arr[i, j] = framei.rmsd(framej)

    print "time = %s" % (time() - t0)

if __name__ == "__main__":
    calc_pairwise_rmsd()
