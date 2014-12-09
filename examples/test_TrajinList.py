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
toplist.AddParmFile(topname)

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
trajlist.AddTrajin("./data/md1_prod.Tc5b.x", argIn, toplist)
#print trajlist.mode()
#print trajlist.max_frames

# STATUS: got Segmentation fault (core dumped)
# Reason: can not create Trajin instance (this class in cpptraj has virtual methods)
trajin = trajlist.front()
print trajin.TotalFrames
print trajin.TotalReadFrames
#frame = trajin.GetNextFrame()
for traj in trajlist:
    pass
