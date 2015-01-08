import os
import unittest
from pycpptraj.Topology import Topology
from pycpptraj.ArgList import ArgList
from pycpptraj.Frame import Frame
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FrameList import FrameList
from pycpptraj.TopologyList import TopologyList 

class TestFrameList(unittest.TestCase):
    def test_1(self):
        datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
        toplist = TopologyList()
        toplist.add_parm("./data/Tc5b.top")
        top = toplist.get_parm(0)
        arglist = ArgList("./data/Tc5b.nat.crd")
        print "===================="
        print "toplist.info()"
        toplist.info()
        print "===================="
        try:
            top.n_atoms = 3000
        except:
            print "can't not set n_atoms"
        print "===================="
        
        #mylist = FrameList()
        #mylist.add_ref_frame(arglist, toplist)
        #aref = mylist.get_active_reference()
        #mylist.list()
        #print mylist.n_frames
        #
        #print aref.xyz

if __name__ == "__main__":
    unittest.main()
