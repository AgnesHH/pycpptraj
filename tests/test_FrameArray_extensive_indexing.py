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

    def test_reverse_0(self):
        farray = FARRAY.copy()
        N = farray.size
        #farray_sub = farray[:-1:-3]
        print "SPECIALLLLLLLLLLLLLLLLLLLLLLL"
        print N
        farray_sub = farray[:-3]
        assert farray_sub.size + 3 == N
        print farray_sub.size
        print "SPECIALLLLLLLLLLLLLLLLLLLLLLL"
        print farray_sub
        #assert farray[N-1].has_same_coords(farray_sub[0])

if __name__ == "__main__":
    unittest.main()
