import os
from pycpptraj.Frame import Frame
from pycpptraj.Topology import Topology
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ArgList import ArgList
from pycpptraj.FileName import FileName
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.Trajin import Trajin
from pycpptraj.TrajinList import TrajinList

topname = "./data/Tc5b.top"
trajoutname = "./data/test.x"
refname = "./data/Tc5b.nat.crd"
trajinname = "./data/md1_prod.Tc5b.x"
toplist = TopologyList()
toplist.add_parm_file(topname)

#creat TrajinList instance
trajininput= """
reference Tc5b.nat.crd
dihedral psi1 :1@N :1@CA :1@C :2@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat 
dihedral phi2 :1@C :2@N :2@CA :2@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral psi2 :2@N :2@CA :2@C :3@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral phi3 :2@C :3@N :3@CA :3@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
rmsd reference out rmsd.dat :3-18@CA
go
"""
argIn = ArgList(trajininput)
trajlist = TrajinList()
trajlist.add_trajin("./data/md1_prod.Tc5b.x", argIn, toplist)
print trajlist.mode()
print trajlist.max_frames

# STATUS: got Segmentation fault (core dumped)
# Reason: can not create Trajin instance (this class in cpptraj has virtual methods)
#trajin = trajlist.front()
#print trajin.total_frames
#print trajin.total_read_frames
#frame = trajin.get_next_frame()
trajs = []
for traj in trajlist:
    trajs.append(traj)

traj = trajs[0]
print "current frame: ", traj.current_frame
print traj.num_frames_processed
print traj.offset
print traj.total_frames
print traj.total_read_frames
#traj.print_frame_info()
traj.start()
print "current frame: ", traj.current_frame
frame = Frame()
top = Topology(topname)
#frame.set_frame_v(top, 0, 0)
#traj.get_next_frame(frame)
#print frame.crd(0)
