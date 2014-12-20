import os
from pycpptraj.actions.Action_Dihedral import Action_Dihedral
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Topology import Topology
from pycpptraj.Frame import Frame
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ArgList import ArgList
from pycpptraj.FileName import FileName
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.CpptrajFile import CpptrajFile
from pycpptraj.Trajin import Trajin
from pycpptraj.TrajinList import TrajinList
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Command import Command
from pycpptraj.FrameList import FrameList

# setup filenames
datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
trajoutname = datadir + "test.x"
refname = "./data/Tc5b.nat.crd"
trajinname = datadir + "md1_prod.Tc5b.x"

# create top list and topology
#toplist = TopologyList()
#toplist.add_parm_file(datadir + "Tc5b.top")
#top = toplist[0]
#top.summary()

#creat TrajinList instance
trajininput= """
parm ./data/Tc5b.top
trajin ./data/md1_prod.Tc5b.x
dih :1@C :2@N :2@CA :2@C
"""

argIn = ArgList(trajininput)
#trajlist = TrajinList()
#trajlist.add_trajin("./data/md1_prod.Tc5b.x", argIn, toplist)
#print trajlist.mode()
#print trajlist.max_frames
#end TrajinList

#state = CpptrajState()
#state.toplist.add_parm_file(topname)
#state.toplist.info()
#state.add_trajin(argIn)
#state.add_trajin(trajinname)
#state.Run()
#state.RunAnalyses()

# test refFrame
def test_ref():
    refFrame = ReferenceFrame()
    refFrame.load_ref("./data/Tc5b.nat.crd", top, 0)
    topref = refFrame.top
    crd = refFrame.frame
    print crd.size/3
    topref.set_reference_coords( refFrame.frame  )
    topref.residue_info(":2-5")

def test_process_input():
    state = CpptrajState()
    command = Command()
    fname = "./data/pycpptraj.in"
    #command.process_input(state, fname)
    state.add_action(Action_Dihedral(), argIn)
    print state.trajlist
    print state.trajlist.mode
    print state.trajlist.list()
    #print help(state)
    #state.toplist.info()

print "test_process_input"
state2 = CpptrajState()
toplist = state2.toplist
toplist.add_parm_file("./data/Tc5b.top")
state2.add_trajin("./data/md1_prod.Tc5b.x")
state2.add_reference("./data/Tc5b.nat.crd")
state2.add_action(Action_Rmsd(), ArgList("@CA"))
state2.framelist.set_active_ref(0)
#state2.add_action(Action_Dihedral(), ArgList("@CA"))
state2.set_no_progress()
print state2.trajlist
#state2.run()

#state2.traj_length("./data/Tc5b.top", ["./data/md1_prod.Tc5b.x",])
#state2.add_trajin("./data/md1_prod.Tc5b.x")
#state2.add_trajin("./data/md1_prod.Tc5b.x")
#test_process_input()
