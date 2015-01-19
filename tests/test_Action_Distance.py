import unittest
from pycpptraj.base import *
from pycpptraj import allactions
from pycpptraj.cast_dataset import cast_dataset

farray = Trajin_Single(top=Topology("./data/Tc5b.top"), 
                    filename='data/md1_prod.Tc5b.x', 
                    )

class TestDistance(unittest.TestCase):
    def test_0(self):
        dslist = DataSetList()
        dslist2 = DataSetList()
        act = allactions.Action_Distance()
        act_radgyr = allactions.Action_Radgyr()

        act.master(command="distance :1@CA :2@CA", 
                   currentframe=farray,
                   currenttop=farray.top, dslist=dslist)

        act_radgyr.master(command="radgyr @CA",
                   currentframe=farray,
                   currenttop=farray.top, dslist=dslist2)
       
        d1 = cast_dataset(dslist[0], dtype="general")
        d2 = cast_dataset(dslist2[0], dtype="general")
        print d1.data[:10]
        print d2.data[:10]

if __name__ == "__main__":
    unittest.main()
