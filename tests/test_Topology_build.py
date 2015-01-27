import unittest
from pycpptraj.base import *
from pycpptraj import NameType
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        top = Topology()
        atom = Atom(NameType("H3D"), NameType(""))
        top.add_atom(atom=atom, resid=1, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.bond_info()

if __name__ == "__main__":
    unittest.main()
