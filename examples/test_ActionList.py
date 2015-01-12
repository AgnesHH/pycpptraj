from copy import copy
from pycpptraj.base import *
from pycpptraj import allactions

top = Topology("./data/Tc5b.top")
ref = ReferenceFrame()
ref.load_ref("./data/Tc5b.nat.crd", top)
refframe = ref.frame
mdx = "./data/md1_prod.Tc5b.x"

farray = FrameArray()
traj = Trajin_Single()
traj.load(mdx, top)
frame = Frame()
frame.set_frame_v(top, traj.has_vel(), traj.n_repdims)
atm = AtomMask(":1-20@CA")

input2 = """
reference ./data/Tc5b.nat.crd
distance d1 :2@CA :10@CA
rmsd reference out test.out :1-20@CA
"""

arglist = ArgList(input2)
traj.load(mdx, top, arglist)
alist = ActionList()
armsd = allactions.Action_Rmsd()
distact = allactions.Action_Distance()
toplist = TopologyList()
toplist.add_parm("./data/Tc5b.top")
framelist = FrameList()

# add to farray
traj.begin_traj(1)
for i in range(10):
    traj.read_traj_frame(i, frame)
    farray.append(frame)
traj.end_traj()

print "test ActionList"
stripact = allactions.Action_Strip()
dsetlist = DataSetList()
dflist = DataFileList()
alist.add_action(stripact, ArgList("@H*"), toplist, framelist, dsetlist, dflist)
print "test setup_actions"
print alist.n_actions
alist.setup_actions(toplist[0])
alist.setup_actions(top)
print top.n_atoms
print toplist[0].n_atoms
print "farray[0].n_atoms = ", farray[0].n_atoms
alist.do_actions(farray[0])
print "farray[0].n_atoms = ", farray[0].n_atoms
frame0 = farray[0]
print "frame0.n_atoms = ", frame0.n_atoms
alist.do_actions(frame0)
print "frame0.n_atoms = ", frame0.n_atoms
