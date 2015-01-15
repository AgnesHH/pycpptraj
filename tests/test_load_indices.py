import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj.io import load

from load_traj import load as npload

class TestIndices(unittest.TestCase):
    def test_0(self):
        indices = (100, 10, 30)

        # load 3 frames 101, 11, 31 (in real life, index starts from 1)
        traj0 = FrameArray()
        traj0.load(fname="./data/md1_prod.Tc5b.x", top=Topology("./data/Tc5b.top"), indices=indices)
        # load whole traj
        traj1 = Trajin_Single(fname="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")

        # check if loading correctly
        # if 'True': wrong indexing
        # we actually sorted indices before reading
        print traj0[0][:10]
        assert traj0[0].same_coords_as(traj1[10]) == True
        assert traj0[1].same_coords_as(traj1[30]) == True
        assert traj0[2].same_coords_as(traj1[100]) == True

        print "wrong indexing"
        print traj0[0].same_coords_as(traj1[10])
        print traj0[0][:10]
        print traj1[0][:10]
        print traj1[99][:10]
        print traj1[101][:10]
        
        traj0[0][-1:-15:-1]
        rmsd0 = traj0[0].rmsd(traj1[100])
        print rmsd0

        rmsdlist = []
        ref = traj1[0].copy()
        for frame in traj1:
            #print frame
            rmsdlist.append(frame.rmsd(ref))

        nparr = np.array(rmsdlist)
        print np.where((nparr-rmsd0) < 1E-2)

        for i in range(traj1.size):
            if traj0[0][0] in traj1[i].coords:
                print i

if __name__ == "__main__":
    unittest.main()

