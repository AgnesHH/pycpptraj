import unittest
from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj import allactions
from pycpptraj.actions import Action
from pycpptraj.misc import strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.decorators import no_test

print dir(Action_Strip())

farray = FrameArray(top=Topology("./data/Tc5b.top"), fname='data/md1_prod.Tc5b.x')

class TestStrip(unittest.TestCase):
    def test_master(self):
        top = Topology("./data/Tc5b.top")
        newtop = top.copy()
        frame0 = farray[0].copy()
        newframe = Frame()
        act = Action_Strip()
        act_surf = allactions.Action_Surf()

        for i in range(10):
            currentframe = farray[i]
            newframe = Frame()
            dslist = DataSetList()
            act.master(command="strip !@CA", 
                       currenttop=top, 
                       dslist=dslist,
                       currentframe=frame0, 
                       newframe=newframe, 
                       newtop=newtop)
    @no_test
    def test_0(self):
        print "newtop"
        farray0 = farray.copy()
        newtop = farray0.top.copy()
        oldtop = farray0.top
        
        toplist = TopologyList()
        toplist.add_parm(newtop)
        dslist = DataSetList()
        dflist = DataFileList()
        
        stripact = Action_Strip()
        #stripact.read_input("strip !@CA", toplist)
        stripact.read_input("strip !@CA", oldtop)
        stripact.process(oldtop, newtop)

        frame0 = Frame(farray.top.n_atoms)
        stripact.do_action(0, farray[0], frame0)
        print frame0.size
        assert frame0.size == 60
        assert frame0.size != farray0[0].size

        stripact.do_action(0, farray[0], farray[0])
        print "after stripping", farray[0].size

        frame0_view = farray0[0]
        stripact.do_action(0, farray0[0], frame0_view)
        print "after stripping", farray0[0].size
        print frame0_view.n_atoms
        print newtop.n_atoms


if __name__ == "__main__":
    unittest.main()
