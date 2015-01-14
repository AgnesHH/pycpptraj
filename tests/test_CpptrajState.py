import os
from pycpptraj.Timer import Timer
from pycpptraj.base import FrameArray
from pycpptraj.actions.Action_Box import Action_Box
from pycpptraj.datasets.DataSet_1D import DataSet_1D
from pycpptraj.DataFileList import DataFileList
from pycpptraj.cast_dataset import cast_dataset
from pycpptraj.DataSetList import DataSetList
from pycpptraj.datasets.DataSet import DataSet
from pycpptraj.actions.Action_Dihedral import Action_Dihedral
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.actions.Action_Distance import Action_Distance
from pycpptraj.Topology import Topology
from pycpptraj.Frame import Frame
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ArgList import ArgList
from pycpptraj.FileName import FileName
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.CpptrajFile import CpptrajFile
from pycpptraj.trajs.Trajin import Trajin
from pycpptraj.TrajinList import TrajinList
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.FrameList import FrameList

# setup filenames
datadir = "./data/"
topname = datadir + "Tc5b.top"
trajoutname = datadir + "test.x"
refname = "./data/Tc5b.nat.crd"
trajinname = datadir + "md1_prod.Tc5b.x"


#creat TrajinList instance
trajininput= """
parm ./data/Tc5b.top
trajin ./data/md1_prod.Tc5b.x
dih :1@C :2@N :2@CA :2@C
"""

argIn = ArgList(trajininput)

import unittest

class TestCpptrajState(unittest.TestCase):
#    def test_ref(self):
#        refFrame = ReferenceFrame()
#        refFrame.load_ref("./data/Tc5b.nat.crd", Topology(topname), 0)
#        topref = refFrame.top
#        crd = refFrame.frame
#        print crd.size/3
#        topref.set_reference_coords( refFrame.frame  )
#        topref.residue_info(":2-5")
#    
#    def test_process_input(self):
#        state = CpptrajState()
#        toplist = state.toplist
#        toplist.add_parm("./data/Tc5b.top")
#        fname = "./data/pycpptraj.in"
#        state.add_action(Action_Dihedral(), ArgList(":1@C  :2@N  :2@CA :2@C"))
#        print state.trajinlist
#        print state.trajinlist.mode
#        print state.trajinlist.list()
#    
    def test_run(self):
        print "test_process_input"
        state2 = CpptrajState()
        toplist = state2.toplist
        toplist.add_parm("./data/Tc5b.top")
        state2.add_trajin("./data/md1_prod.Tc5b.x")
        state2.add_reference("./data/Tc5b.nat.crd")
        state2.add_action(Action_Distance(), ArgList("distance :2@CA :10@CA"))
        state2.add_action(Action_Distance(), ArgList("distance :4@CA :10@CA"))
        state2.framelist.set_active_ref(0)
        print "test framelist.list()"
        state2.run()
        dslist = state2.datasetlist
        d0 = dslist[0]
        print "d0 is empty? ", d0.is_empty()
        d1 = cast_dataset(d0, dtype="general")
        print "d1 is empty? ", d1.is_empty()
        print d1.data[0:10]


    def test_action(self):
        distaction = Action_Distance()
        boxaction = Action_Box()
        boxaction.help()
        toplist = TopologyList()
        framelist = FrameList()
        dsetlist = DataSetList()
        dflist = DataFileList()

        # add stuff
        toplist.add_parm("./data/Tc5b.top")
        framelist.add_reference(ArgList("./data/Tc5b.nat.crd"), toplist)
        distaction.read_input(ArgList(":2@CA :10@CA"), toplist, framelist, dsetlist, dflist, 0)
        boxaction.read_input(ArgList("x 1000. y 1000. alpha 500."), toplist, framelist, dsetlist, dflist, 0)
        distaction.process(toplist[0])

        idx = 0
        farray = FrameArray("./data/Tc5b.nat.crd", "./data/Tc5b.top")
        distaction.do_action(0, farray[idx])
        frame0 = farray[idx]
        # update Frame instance with new Box info
        boxaction.do_action(idx, frame0)
        boxnew = frame0.get_box()

        print "box = ", boxnew.boxarr
        print boxnew
        boxaction.print_output()
        distaction.print_output()
        # how to get output?
#
if __name__ == "__main__":
    unittest.main()
