import os
from time import time
import unittest
import numpy as np
from pycpptraj.base import *
from pycpptraj.Timer import Timer
from load_traj import load
from decorator import no_test

ts = Trajin_Single()
datadir = "./data/"
topname = datadir + "Tc5b.top"
refname = "./data/Tc5b.nat.crd"
mdx = "./data/md1_prod.Tc5b.x"
ts = Trajin_Single()
print ts.top.tag

top = Topology(topname)
trajin = """
"""

ts.load(mdx, top)
ts.prepare_for_read(True)
frame = Frame()
frame.set_frame_v(top, ts.has_vel(), ts.n_repdims)
frame2 = Frame(frame)

# create FrameArray to store Frame
FARRAY = FrameArray()
#FARRAY.get_frames(ts, update_top=True)
FRAMENUM=999
FARRAY = ts[:FRAMENUM]

class TestFrameArray(unittest.TestCase):

    def test_len(self):
        N = 10
        farray = FARRAY[:N].copy()
        assert farray.size == N
        old_coords_5_10 = farray[5].coords[:10]
        assert farray[:3].size == 3
        assert farray[1:3].size == 2
        assert farray[3:1].size == 0
        assert farray[3:1:-1].size == 2
        assert farray[-1:-3].size == 0
        assert farray[-1:-3:-1].size == 2
        assert farray[-1].same_coords_as(farray[N-1]) == True

        #assert farray[5:1:-1][0].same_coords_as(farray[5]) == True
        # segment fault if using below expression
        #print farray[5:1:-1][0].coords[:10]

        # need to create a temp farray
        subfarray = farray[5:1:-1]
        print subfarray
        assert subfarray[0].same_coords_as(farray[5]) == True
        assert old_coords_5_10 == farray[5].coords[:10]
        print subfarray[0].coords[:10]
        print farray[5].coords[:10]

    def test_len_Trajin_Single(self):
        # create alias of `ts` (Trajin_Single instance  created above)
        farray = ts
        N = ts.size
        assert farray.size == N
        old_coords_5_10 = farray[5].coords[:10]
        assert farray[:3].size == 3
        assert farray[1:3].size == 2
        assert farray[3:1].size == 0
        assert farray[3:1:-1].size == 2
        assert farray[-1:-3].size == 0
        assert farray[-1:-3:-1].size == 2
        assert farray[-1].same_coords_as(farray[N-1]) == True

        #assert farray[5:1:-1][0].same_coords_as(farray[5]) == True
        # segment fault if using below expression
        #print farray[5:1:-1][0].coords[:10]

        # need to create a temp farray
        subfarray = farray[5:1:-1]
        print subfarray
        assert subfarray[0].same_coords_as(farray[5]) == True
        assert old_coords_5_10 == farray[5].coords[:10]
        print subfarray[0].coords[:10]
        print farray[5].coords[:10]

if __name__ == "__main__":
    unittest.main()
