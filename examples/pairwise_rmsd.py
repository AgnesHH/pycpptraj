import numpy as np
from pycpptraj.base import *

TRAJ = Trajin_Single()
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
    for i in range(size):
        for j in range(size):
            arr[i, j] = farray[i].rmsd(farray[j])

if __name__ == "__main__":
    calc_pairwise_rmsd()
