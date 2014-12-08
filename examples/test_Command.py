import os
from pycpptraj.Topology import Topology
from pycpptraj.TopologyList import TopologyList
from pycpptraj.ArgList import ArgList
from pycpptraj.FileName import FileName
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.Trajin import Trajin
from pycpptraj.TrajinList import TrajinList
from pycpptraj.Command import Command

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
topname = datadir + "Tc5b.top"
trajoutname = datadir + "test.x"
refname = "./data/Tc5b.nat.crd"
#trajinname = datadir + "md1_prod.Tc5b.x"
trajin_list = ["./md1_prod.Tc5b.x",]
toplist = TopologyList()
toplist.AddParmFile(datadir + "Tc5b.top")

#creat TrajinList instance
trajininput= """
ref Tc5b.nat.crd
dihedral psi1 :1@N :1@CA :1@C :2@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat 
dihedral phi2 :1@C :2@N :2@CA :2@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral psi2 :2@N :2@CA :2@C :3@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral phi3 :2@C :3@N :3@CA :3@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
rms reference out rmsd.dat :3-18@CA
go
"""

cmmlist = "rms reference out rmsd.dat :3-18@CA"

state = CpptrajState()
state.TrajLength(topname, trajin_list)
command = Command()
print command.Dispatch(state, cmmlist)

