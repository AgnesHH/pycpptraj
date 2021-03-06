import unittest
from pycpptraj.base import *
from pycpptraj import NameType
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        top = Topology()
        atom = Atom("H3D", "CA")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.add_atom(atom=atom, resid=0, resname="H3D")
        top.summary()
        print top.get_atom_indices("@H=")

if __name__ == "__main__":
    unittest.main()
