import unittest
from sets import Set
from glob import glob
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
       flist = glob("./data/Test_RemdTraj/rem.nc.*") 
       trajlist = []
       for fh in flist:
           topfile = "./data/Test_RemdTraj/ala2.99sb.mbondi2.parm7"
           trajlist.append(mdio.load(fh, topfile))

       Tset = Set([])
       f4922 = FrameArray()
       f4922.resize(trajlist[0].n_frames)
       print f4922.n_frames
       f4922.top = trajlist[0].top.copy()

       for traj in trajlist:
           for idx, frame in enumerate(traj):
               if frame.temperature == 492.2:
                   f4922[idx] = frame

       print f4922.temperatures
       print f4922[0, 0, :]

       # make sure we reproduce cpptraj output
       cpptraj = mdio.load("./data/Test_RemdTraj/temp0.crd.492.20", topfile)

       for idx, framepy in enumerate(f4922):
           assert_almost_equal(framepy.coords, cpptraj[idx].coords)

       print "YES"

if __name__ == "__main__":
    unittest.main()
