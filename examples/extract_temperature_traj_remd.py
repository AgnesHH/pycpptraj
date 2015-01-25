"""This script shows how to extract frames having the same temperature
from replica exchange MD run. You can do it with cpptraj but this shows how easily
to write new script with pycpptraj
# TODO : check typos for DOCo
"""

import unittest
from array import array
from sets import Set
from glob import glob
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
       # create a list of all remd trajs
       flist = glob("../tests/data/Test_RemdTraj/rem.nc.*") 

       # make a list of TrajReadOnly instances
       trajlist = []
       for fh in flist:
           topfile = "../tests/data/Test_RemdTraj/ala2.99sb.mbondi2.parm7"
           trajlist.append(mdio.load(fh, topfile))


       # make FrameArray instance that holds 492.2 T frames
       # we need to reserve n_frames to hold the data
       f4922 = FrameArray(n_frames=trajlist[0].n_frames)

       assert f4922.n_frames == trajlist[0].n_frames
       f4922.top = trajlist[0].top.copy()

       for traj in trajlist:
           for idx, frame in enumerate(traj):
               if frame.temperature == 492.2:
                   f4922[idx] = frame

       # make sure f4922 only hold frames having T = 492.2 K
       arr0 = array('d', [492.2, 492.2, 492.2, 492.2, 492.2, 
                         492.2, 492.2, 492.2, 492.2, 492.2])
       assert f4922.temperatures == arr0

       # make sure we reproduce cpptraj output
       cpptraj = mdio.load("../tests/data/Test_RemdTraj/temp0.crd.492.20", topfile)

       for idx, framepy in enumerate(f4922):
           assert_almost_equal(framepy.coords, cpptraj[idx].coords)


           print "rmsd between pycpptraj Frame and cpptraj Frame = %s " % framepy.rmsd(cpptraj[idx])

       print f4922[5].coords[:10]
       print cpptraj[5].coords[:10]

       print "YES"

if __name__ == "__main__":
    unittest.main()
