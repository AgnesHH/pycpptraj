import os
from copy import copy
import unittest
import numpy as np
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.trajs.Trajin import Trajin
from pycpptraj.ArgList import ArgList
from pycpptraj.Topology import Topology
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Energy import Energy_Amber
from pycpptraj.AtomMask import AtomMask

from pycpptraj.utils.check_and_assert import assert_almost_equal

class TestTrajinSingle(unittest.TestCase):
    def test_dummy(self):

        ts = Trajin_Single()
        basetraj = Trajin()
        datadir = "./data/"
        topname = datadir + "Tc5b.top"
        refilename = "./data/Tc5b.nat.crd"
        mdx = "./data/md1_prod.Tc5b.x"
        ts = Trajin_Single()
        
        top = Topology(topname)
        trajin = """
        """
        
        ts.load(mdx, top)
        frame = Frame(ts.top.n_atoms)
        #ts.begin_traj()
        with ts:
            ts.read_traj_frame(100, frame)
            print frame
        
        # bug: results are not the same between
        # ts[0, 0, 0] and ts[0][0, 0]
        #print ts[0, 0, 0]
        #print ts[0, 0, 0:2][0]
        #print ts[:, :, :]
        #print "ts[0, 0, 0]", ts[0, 0, 0]
        #assert ts[0, 0, 0] == ts[0][0, 0]
        frame0 = ts[0]
        assert ts[0][0, 0] == frame0[0, 0]

    def test_indexing(self):
        traj = Trajin_Single("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        #print traj[0][0, :]
        #print traj[0, 0, :]
        #print traj[0, :, :][0]
        #print traj[0][0, :]
        print type(traj[:][0, 0])
        print type(traj[0][0, :])
        print traj[:][0, 0]
        print traj[0][0, :]
        print traj[0][0, :][0] == traj[:][0, 0, 0]
        print traj[0:1]
        arr0 = np.array(traj[:][0, 0], copy=True)
        arr1 = np.array(traj[0][0, :], copy=True)
        print arr0[:10], arr1[:10]

        print traj[:][0, 0]
        print traj[0][0, :]
        print traj[0][0, :] == traj[:][0, 0]
        print traj[:][0, 0]
        print traj[0][0, :]
        print traj[0][0, :] == traj[:][0, 0]
        for x in traj[:][0, 0]:
            print x
        for x in traj[0][0, :]:
            print x
        print  "TODO : wrong result"

        assert_almost_equal (arr0, arr1)
        # create FrameArray instance
        traj2 = traj[:]
        assert_almost_equal (traj2[0][0, :], traj2[:][0, 0])
        assert_almost_equal (traj2[0][0, :], traj2[:][0, 0])
        assert_almost_equal (traj2[0][0, :], traj2[:][0, 0])
        assert_almost_equal (traj2[0][0, :], traj2[:][0, 0])

        print traj2[0][0, :] == traj2[:][0, 0]
        print traj2[0][0, :] == traj2[:][0, 0]
        print traj2[0][0, :] == traj2[:][0, 0]

    def test_get_array(self):
        print "test_get_array"
        traj = Trajin_Single("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        arr0 = np.array(traj[:, :, :], copy=True)
        for i in range(304):
            assert_almost_equal(arr0[0, i], traj[0, i][:])

        # update arr0 and we expect this does not change traj[0, 0][:]
        # (Trajin_Single is ReadOnly)
        # we make copy too
        arr0[0, 0] = (1., 2., 3.)
        print arr0[0, 0]
        assert_almost_equal(arr0[0, 0] == traj[0, 0][:], [False, False, False])

        print arr0.shape
        print arr0.shape
        frame = Frame(arr0[0].reshape(912,))
        assert frame.size == traj[0].size
        assert frame[:].all() == arr0[0].all()
        print frame.check_coords_invalid()

if __name__ == "__main__":
    unittest.main()
