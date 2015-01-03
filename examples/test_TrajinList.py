import os
from pycpptraj.base import *
from pycpptraj.TrajinList import TrajinList

topname = "./data/Tc5b.top"
trajoutname = "./data/test.x"
refname = "./data/Tc5b.nat.crd"
trajinname = "./data/md1_prod.Tc5b.x"
toplist = TopologyList()
toplist.add_parm(topname)
toplist.info()

top = toplist[0]
#print top
#top.summary()

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
trajlist.add_traj("./data/md1_prod.Tc5b.x", argIn, toplist)
trajlist.add_traj("./data/md1_prod.Tc5b.x", argIn, toplist)
trajlist.add_traj("./data/md1_prod.Tc5b.x", argIn, toplist)
trajlist.add_traj("./data/md1_prod.Tc5b.x", argIn, toplist)
print trajlist.max_frames
