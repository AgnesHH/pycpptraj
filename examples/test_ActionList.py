from copy import copy
from pycpptraj.FrameList import FrameList
from pycpptraj import cpptraj_dict
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Distance import Action_Distance
from pycpptraj.TopologyList import TopologyList
from pycpptraj.DataFileList import DataFileList
from pycpptraj.DataSetList import DataSetList
from pycpptraj.actions.Action_Dihedral import Action_Dihedral
from pycpptraj.Topology import Topology
from pycpptraj.ParmFile import ParmFile
from pycpptraj.Frame import Frame
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Trajin_Single import Trajin_Single 
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.FrameArray import FrameArray
from pycpptraj.actions.Action_Rmsd import Action_Rmsd
from pycpptraj.Cluster_DBSCAN import Cluster_DBSCAN
from pycpptraj.ActionList import ActionList
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj._FunctPtr import FunctPtr
from pycpptraj.actions.Action import Action
from pycpptraj.PointerVec import TopVec, FrameVec

top = Topology("./data/Tc5b.top")
ref = ReferenceFrame()
ref.load_ref("./data/Tc5b.nat.crd", top)
refframe = ref.frame
mdx = "./data/md1_prod.Tc5b.x"

farray = FrameArray()
traj = Trajin_Single()
traj.load(mdx, ArgList(), top)
frame = Frame()
frame.set_frame_v(top, traj.has_velocity(), traj.nreplica_dimension())
atm = AtomMask(":1-20@CA")

input2 = """
reference ./data/Tc5b.nat.crd
distance d1 :2@CA :10@CA
rmsd reference out test.out :1-20@CA
"""

arglist = ArgList(input2)
traj.load(mdx, arglist, top)
alist = ActionList()
armsd = Action_Rmsd()
distact = Action_Distance()
toplist = TopologyList("./data/Tc5b.top")
framelist = FrameList()
framelist.add_ref_frame(arglist, toplist)

# add to farray
traj.begin_traj(1)
for i in range(10):
    traj.read_traj_frame(i, frame)
    farray.append(frame)
traj.end_traj()

print "test ActionList"
alist.add_action(armsd, ArgList(), toplist, framelist, DataSetList(), DataFileList())
alist.add_action(distact, ArgList(), toplist, framelist, DataSetList(), DataFileList())
print "test setup_actions"
alist.setup_actions(top)
#alist.do_actions(farray, 0)
