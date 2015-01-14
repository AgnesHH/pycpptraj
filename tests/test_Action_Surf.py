import unittest
from pycpptraj.base import *
from pycpptraj.actions.Action_Surf import Action_Surf
from pycpptraj.actions import Action
from pycpptraj.misc import strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj import cast_dataset

print dir(Action_Surf())

farray = FrameArray(top=Topology("./data/Tc5b.top"), fname='data/md1_prod.Tc5b.x')

class TestSurf(unittest.TestCase):
    def test_0(self):
        print "newtop"
        farray0 = farray.copy()
        newtop = farray0.top.copy()
        oldtop = farray0.top
        
        toplist = TopologyList()
        toplist.add_parm(newtop)
        dslist = DataSetList()
        dflist = DataFileList()
        
        stripact = Action_Surf()
        stripact.read_input("surf @CA \n name test", oldtop, dslist=dslist)
        stripact.process(oldtop, newtop)

        frame0 = Frame(farray.top.n_atoms)
        stripact.do_action(0, farray[0], frame0)
        #d0db = cast_dataset(d0, dtype='dataset_double')
        d0db = cast_dataset(dslist[0], dtype='general')
        print d0db.data
        print cast_dataset

if __name__ == "__main__":
    unittest.main()
