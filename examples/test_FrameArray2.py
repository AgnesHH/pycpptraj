import unittest 
import numpy as np
from time import time
from pycpptraj.base import *
from pycpptraj.FrameArray2 import FrameArray2 as FrameArray2ReadOnly
from decorator import no_test

TRAJ = FrameArray2()
TRAJ.top = Topology("data/Tc5b.top")
TRAJ.load("./data/md1_prod.Tc5b.x")

TRAJ2 = FrameArray2()
TRAJ2.top = TRAJ.top
TRAJ2.load("./data/md1_prod.Tc5b.x")

class TestFrameArray2(unittest.TestCase):
    def test_indices_0(self):
        # FIXME : incorrect memoryview when using TRAJ2[0].buffer
        # why?  TRAJ2[0] will return a temp Frame instance, if we don't hold this instance, 
        # its memory will be freed --> zero coords since we no longer have buffer?
        # everytime we use TRAJ2[0], Python actually create a new Frame instance
        # Solution: don't let Python free memory if using this style?
        TRAJ2[0].py_free_mem = False
        buffer = TRAJ2[0].buffer
        print "start testing `buffer`+++++++++"
        print buffer
        print buffer
        print "end testing `buffer`+++++++++"
        print "calling TRAJ[0] several time, what do we expect?"
        print TRAJ[0]
        print TRAJ[0]
        frame = TRAJ[0]
        print TRAJ[0]
        print frame
        print "calling TRAJ[0] several time, is what we are expecting?"
        print np.asarray(frame.buffer)[0:10]
        print np.asarray(TRAJ[0].buffer)[0:10]

        print "test buffer of Frame"
        frame.py_free_mem = False
        frame.buffer
        print "end test buffer of Frame"

    @no_test
    def test_indices_1(self):
        """test repeating indexing
        """
        frame0_0 = TRAJ2[0]
        frame1 = TRAJ2[0]
        frame2 = TRAJ2[0]
        print frame0_0, frame1, frame2
        print frame0_0.coords_copy()[:10]

        assert frame0_0.coords_copy() == frame1.coords_copy() == frame2.coords_copy()

        print "updating coords for frame0_0, make sure does not change frame1, frame2"
        frame0_0[0] = 10000.
        assert frame0_0.coords_copy() != frame1.coords_copy() == frame2.coords_copy()
        assert frame1.coords_copy() == frame2.coords_copy()
        assert frame0_0.coords_copy() != TRAJ2[0].coords_copy()
        assert frame1.coords_copy() == TRAJ2[0].coords_copy() == frame2.coords_copy()

        frame0_0_arr = np.asarray(frame0_0.buffer)
        print frame0_0_arr[:10]
        print frame0_0.coords_copy()[:10]
        #assert frame0_0_arr[:10] == np.array(frame0[:10])

    @no_test
    def test_indices(self):
        """play with frame and traj[0] (frame = traj[0])"""
        traj = TRAJ
        frame = traj[0]
        print frame
        print traj[0]
        print frame.coords_copy()[:10]
        print traj[0].coords_copy()[:10]

        print "make sure frame is not an alias of traj[0]"
        assert frame != traj[0]

        # other test
        print frame.size, traj[0].size
        assert frame.size == traj[0].size
        assert frame.n_atoms == traj[0].n_atoms 

        print "make sure frame.buffer is equal (but not an alias) of traj[0]"
        frame_arr = np.asarray(frame.buffer)
        traj0_arr = np.asarray((traj[0]).buffer)
        print frame_arr[:10]
        print traj0_arr[:10]
        print np.testing.assert_almost_equal(frame_arr, traj0_arr, decimal=3)

    @no_test
    def test_strip_atoms(self):
        farray = FrameArray()
        #farray.get_frames(TRAJ, update_top=True)
        farray.get_frames(TRAJ, indices=(1, 3, 5, 7,), update_top=True)
        t0 = time()
        farray.strip_atoms(":2-10@CA")
        print time() - t0
        print farray.size

    @no_test
    def test_general(self):
        traj = FrameArray2()
        traj2 = FrameArray2()
        print dir(traj)
        print traj.top.is_empty()
        traj.top = Topology("data/Tc5b.top")
        traj2.top = Topology("data/Tc5b.top")
        
        traj.load("./data/md1_prod.Tc5b.x")
        
        print traj.data_format
        print traj.data_type
        print traj.is_torsion_array()
        print traj.is_empty()
        print traj.ndim
        print traj.idx
        
        frame = traj.allocate_frame()
        print frame.n_atoms
        print frame.size
        print frame.is_empty()
        print frame
        
        #traj.add_frame(frame)
        print frame[0]
        traj.get_frame(0, frame)
        print frame[0]
        
        frame0 = traj[0]
        assert frame0.coords_copy() == frame.coords_copy()
        
        # make sure that frame and frame0 are copies. Changing frame0 does not affact frame
        frame0[10] = 10000.
        assert frame0.coords_copy() != frame.coords_copy()
        #traj.get_frame(1, frame)
        #print frame[0]

if __name__ == "__main__":
    unittest.main()
