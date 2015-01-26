import unittest
from pycpptraj.base import *
from pycpptraj import io as mdio
from pycpptraj.NameType import NameType

class TestNameType(unittest.TestCase):
    def test_0(self):
        nt = NameType("CA")
        print dir(nt)

if __name__ == "__main__":
    unittest.main()
