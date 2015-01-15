import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj.io import load
from pycpptraj.decorators import no_test

from load_traj import load as npload

class TestIndices(unittest.TestCase):
    #@no_test
    def test_0(self):

        traj1 = Trajin_Single(fname="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        print traj1.size
        indices = slice(100, 97, -1)
        print indices.indices(traj1.size)
        traj0 = FrameArray()
        traj0.load(fname="./data/md1_prod.Tc5b.x", top=Topology("./data/Tc5b.top"), indices=indices)
        print traj0.size
        # load whole traj

        # check if loading correctly
        # if 'True': wrong indexing
        # we actually sorted indices before reading
        print traj0[0][:10]
        # traj0[0] must has the same coords as [traj1[100]]
        assert traj0[0].same_coords_as(traj1[100]) == True
        assert traj0[1].same_coords_as(traj1[99]) == True
        assert traj0[2].same_coords_as(traj1[98]) == True

        print traj0[0]
        assert traj0[0].rmsd(traj1[100]) < 1E-4

        rmsdlist = []
        ref = traj1[0].copy()
        for frame in traj1:
            #print frame
            rmsdlist.append(frame.rmsd(ref))

        nparr = np.array(rmsdlist)
        for i in range(traj1.size):
            if traj0[0][0] in traj1[i].coords:
                pass

        # make sure we don't suport other indices 
        traj2 = FrameArray()
        traj2.load(fname="./data/md1_prod.Tc5b.x", 
                   top=Topology("./data/Tc5b.top"), 
                   indices=range(100) + range(999, 500, -1) + [499])
        assert traj2[-1].coords == traj1[499].coords


    def test_array_assigment(self):
        traj1 = Trajin_Single(fname="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")[:]
        print traj1[0][10]
        print traj1[100][10]
        traj1[0] = traj1[100]
        print traj1[0].same_coords_as(traj1[100]) 
        print "update traj1[0] and make sure this does not affect traj[100]"
        traj1[0][10] = 1000000.
        assert (traj1[0].same_coords_as(traj1[100])) == False
        print traj1[0][:11]
        print traj1[100][:11]
        assert (traj1[100][:11] == traj1[0][:11]) == False
        assert (traj1[100].coords[:11] == traj1[0].coords[:11]) == False

if __name__ == "__main__":
    unittest.main()

