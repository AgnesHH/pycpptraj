import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.utils.check_and_assert import assert_almost_equal

class Test(unittest.TestCase):
    def test_0(self):
        at = Atom()
        
        print at
        print at.atomic_number
        
        top = Topology("./data/HP36.top")
        a0 = top.atomlist[0]
        print a0
        print a0.element
        print len(a0.element_short_name)
        print a0.atomic_number
        print dir(a0)
        print a0.get_bond_length(1, 7)
        print a0.molnum
        print a0.nbonds
        print a0.typeindex

    def test_0(self):
        at = Atom()
        
        print at
        print at.atomic_number
        
        top = Topology("./data/HP36.top")
        a0 = top.atomlist[0]
        a1 = a0.copy()
        print a1

if __name__ == "__main__":
    unittest.main()
