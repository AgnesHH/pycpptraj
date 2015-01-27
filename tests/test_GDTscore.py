import unittest
import numpy as np
from array import array
from pycpptraj.base import *
from pycpptraj import AtomSelect
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal
from TestGDTscore.gdt import gdt
from TestGDTscore.calc_gdt import calc_GDTscore

class Test(unittest.TestCase):
    def test_0(self):
        traj = mdio.load("./data/md1_prod.Tc5b.x", "./data/Tc5b.top")
        #mdio.writetraj(filename="test_gdt_0.pdb", traj=traj[0], top=traj.top)
        #mdio.writetraj(filename="test_gdt_1.pdb", traj=traj[1], top=traj.top)
        print calc_GDTscore(traj[0], traj[1], "@CA", traj.top, score='tmscore')/1000.
        print calc_GDTscore(traj[1], traj[0], "@CA", traj.top, score='tmscore')/1000.

    def test_1(self):
        traj0 = mdio.load(filename="./test_wrap_TMalign/TM/PDB1.pdb", 
                top="./test_wrap_TMalign/TM/PDB1.pdb")[:]
        traj1 = mdio.load(filename="./test_wrap_TMalign/TM/PDB2.pdb", 
                top="./test_wrap_TMalign/TM/PDB2.pdb")[:]

        print traj0[0].n_atoms
        print traj1[0].n_atoms

        traj0.strip_atoms(mask="!@CA", update_top=True)
        traj1.strip_atoms(mask="!@CA", update_top=True)

        print traj0[0].n_atoms
        print traj1[0].n_atoms

if __name__ == "__main__":
    #unittest.main()
    pass
