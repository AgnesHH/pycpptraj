import unittest
from pycpptraj.base import *
from pycpptraj.actions.Action_Radgyr import Action_Radgyr
from pycpptraj.actions import Action
from pycpptraj.misc import strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj._cast import cast_dataset

print dir(Action_Radgyr())

farray = FrameArray(top=Topology("./data/Tc5b.top"), fname='data/md1_prod.Tc5b.x')

class TestRadgyr(unittest.TestCase):
    def test_0(self):
        print "newtop"
        farray0 = farray.copy()
        newtop = farray0.top.copy()
        oldtop = farray0.top
        
        toplist = TopologyList()
        toplist.add_parm(newtop)
        dslist = DataSetList()
        dflist = DataFileList()
        
        act = Action_Radgyr()
        #act.read_input("strip !@CA", toplist)
        act.read_input("radgyr @CA", oldtop, dslist=dslist)
        act.process(oldtop, oldtop)
        frame0 = Frame(farray.top.n_atoms)
        act.do_action(0, farray[0], frame0)
        print dir(dslist[0])
        d1 = cast_dataset(dslist[0], dtype="dataset_double")
        print d1.data

if __name__ == "__main__":
    unittest.main()
