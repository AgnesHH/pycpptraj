import os
import unittest
from pycpptraj.Topology import Topology
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FileName import FileName
from pycpptraj.base import *
from decorator import no_test

class TestTopology(unittest.TestCase):
    def test_empty_top(self):
        top = Topology()
        print top.file_path()
        assert top.empty() == True
        fname = "./data/Tc5b.top"
        top = Topology(fname)
        print top.file_path()
        assert top.empty() == False

    @no_test
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
        #Parm_Amber().write_parm("test_write.top", top)
        #top.write_parm("test_write2.top")
        
        print "test atom_iterator"
        for atom in top.atom_generator():
            pass
        
        print "test res_iterator"
        for res in top.res_generator():
            pass
        
        print "test mol_iterator"
        for mol in top.mol_generator():
            pass
        
if __name__ == "__main__":
    unittest.main()
