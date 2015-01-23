import unittest
import numpy as np
from array import array
from pycpptraj.base import *
from pycpptraj.io import load
from pycpptraj.decorators import no_test
from pycpptraj.utils.check_and_assert import assert_almost_equal

from load_traj import load as npload

class TestIndices(unittest.TestCase):
    #@no_test
    def test_0(self):

        traj1 = Trajin_Single(filename="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        print traj1.size
        indices = slice(100, 97, -1)
        print indices.indices(traj1.size)
        traj0 = FrameArray()
        traj0.load(filename="./data/md1_prod.Tc5b.x", top=Topology("./data/Tc5b.top"), indices=indices)
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

        # make sure we don't suport other indices 
        traj2 = FrameArray()
        traj2.load(filename="./data/md1_prod.Tc5b.x", 
                   top=Topology("./data/Tc5b.top"), 
                   indices=range(100) + range(999, 500, -1) + [499])
        assert traj2[-1].coords == traj1[499].coords


    def test_array_assigment(self):
        traj1 = Trajin_Single(filename="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")[:]
        print traj1[0][10]
        print traj1[100][10]

        # assign traj1[0] 
        traj1[0] = traj1[100].copy()
        # make sure the assignment happed correctly
        assert traj1[0].same_coords_as(traj1[100]) == True

        print "update traj1[0] and make sure this does not affect traj[100]"
        traj1[0][10, 0] = 1000000.
        assert traj1[0][10, 0] == traj1[0, 10, 0] == 1000000.
        assert (traj1[0].same_coords_as(traj1[100])) == False
        assert traj1[0, 10, 0] != traj1[100, 10, 0]

        print traj1[0][:11]
        print traj1[100][:11]

    def test_1(self):
        traj0 = Trajin_Single(filename="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")
        traj = Trajin_Single(filename="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")[:]
        assert traj[0].coords == traj0[0].coords
        print traj[0].coords[:10]

        traj2 = Trajin_Single(filename="data/md1_prod.Tc5b.x", top="./data/Tc5b.top")[:][:10]
        assert traj2[0].coords == traj0[0].coords

        traj.join(traj[:] + traj[0:100] + traj[999:30:-10])
        traj += traj[:]

        assert traj[0].coords != array('d', [0 for _ in range(traj[0].size)])
        assert traj[-1].coords != array('d', [0 for _ in range(traj[0].size)])

        for frame in traj:
            frame.zero_coords()

        assert traj[0].coords == array('d', [0 for _ in range(traj[0].size)])
        assert traj[-1].coords == array('d', [0 for _ in range(traj[0].size)])

    def test_del_top(self):
        # why here? lazy to make another file
        top = Topology("./data/Tc5b.top")
        top2 = top
        print top2 == top
        print top2
        print top
        del top

if __name__ == "__main__":
    unittest.main()

