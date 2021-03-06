import os
import numpy as np
import unittest
from pycpptraj.Topology import Topology
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FileName import FileName
from pycpptraj.base import *
from pycpptraj.decorators import no_test
from pycpptraj.NameType import NameType

class TestTopology(unittest.TestCase):
    def test_empty_top(self):
        top = Topology()
        print top.file_path()
        assert top.is_empty() == True
        filename = "./data/Tc5b.top"
        top = Topology(filename)
        print top.file_path()
        assert top.is_empty() == False

    #@no_test
    def test_1(self):
        datadir = "./data/" 
        filename = "./data/Tc5b.top"
        
        top = Topology(filename)
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
        for atom in top.atomiter:
            print atom
        
        print "test res_iterator"
        for res in top.residueiter:
            pass
        
        print "test mol_iterator"
        for mol in top.moliter:
            pass

    def test_2(self):
        from pycpptraj import load_sample_data
        # load Ala3
        traj = load_sample_data()
        top = traj.top
        for i in range(top.n_atoms):
            print top.trunc_res_atom_name(i)

        for i in range(top.n_residues):
            print top.trunc_resname_num(i)

        print dir(top)
        print top.n_atoms 
        atom = Atom("CA", "CA")
        restype = NameType("ALA")
        xyz = np.arange(3, dtype=np.float64)
        top.add_atom(atom, 4, restype, xyz)
        assert top.n_atoms == 35
        top.add_atom(Atom("CB", "CB"), 4, restype)
        assert top.n_atoms == 36
        #assert ("TEST" in top.trunc_res_atom_name(34))
        print top.trunc_res_atom_name(34)

        # TODO: cpptraj does not recognize new atom names
        print top[33]
        print top[34]
        print top.n_atoms
        print top[35]

    def test_select_mask(self):
        top = Topology("./data/Tc5b.top")
        arr0 = top.get_atom_indices("@CA")
        print arr0 
        print type(arr0)

    def test_call(self):
        traj = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        top = traj.top
        frame = traj[0]
        print frame[top(":2-18@CA")]

    def test_get_unique(self):
        traj = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        top = traj.top
        print top.get_unique_atomname()
        print top.get_unique_resname()
        print top.get_atomname_set()
        print top.get_resname_set()

    def test_len(self):
        traj = FrameArray("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        top = traj.top
        assert len(top) == top.n_atoms

if __name__ == "__main__":
    unittest.main()
