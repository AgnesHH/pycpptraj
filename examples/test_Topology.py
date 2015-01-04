import os
import unittest
from pycpptraj.Topology import Topology
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FileName import FileName
from pycpptraj.base import *

class TestTopology(unittest.TestCase):
    def test_1(self):
        datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
        fname = "./data/Tc5b.top"
        
        top = Topology(fname)
        #top2 = top.modify_state_by_mask(AtomMask("!@CA"))
        #
        top.summary()
        top.atom_info("@CA")

        print "test strip_atoms: strip all but CA"
        top.strip_atoms("!@CA")
        assert top.n_atoms == 20
        top.summary()
        top.atom_info("@CA")
        top.atom_info("@H")

        print "test Parm_Amber for write"
        Parm_Amber().write_parm("test_write.top", top)
        
        #print "test atom_iterator"
        #for atom in top.atom_generator():
        #    pass
        #
        #print "test res_iterator"
        #for res in top.res_generator():
        #    pass
        #
        #print "test mol_iterator"
        #for mol in top.mol_generator():
        #    pass
        
        #top.print_atom_info("@CA")
        
        # dummy test for modify top
        # test empty file
        #top2 = Topology()
        #top2.summary()

if __name__ == "__main__":
    unittest.main()
