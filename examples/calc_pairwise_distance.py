import math
import numpy as np
from matplotlib import pyplot as plt
from pycpptraj.base import *
from pycpptraj.common_actions import distance

def calc_pairwise_distance():
    traj = FrameArray(filename="./data/md1_prod.Tc5b.x", top="./data/Tc5b.top")

    # extract 11th frame (index start from 0)
    frame0 = traj[10]

    print distance(frame0.coords[0:3], frame0.coords[96:99])
    natoms = frame0.n_atoms
    arr = np.empty((natoms, natoms))
    for i in range(frame0.n_atoms):
        for j in range(frame0.n_atoms):
            arr[i, j] = distance(frame0.atom_xyz(i), frame0.atom_xyz(j))

    arr = np.asmatrix(arr)

    # plot distance matrix
    plt.imshow(arr)
    plt.savefig("./output/dist_mat_0.png")

if __name__ == "__main__":
    calc_pairwise_distance()
