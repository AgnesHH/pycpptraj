from pycpptraj.ArgList import ArgList as AL

arglist = """
parm Tc5b.top
reference Tc5b.nat.crd
trajin ../../output_md1_prod/md1_prod.x 1 20000
dihedral psi1 :1@N :1@CA :1@C :2@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat 
dihedral phi2 :1@C :2@N :2@CA :2@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral psi2 :2@N :2@CA :2@C :3@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral phi3 :2@C :3@N :3@CA :3@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
rmsd reference out rmsd.dat :3-18@CA
go
"""

actionArgs = AL(arglist)
print actionArgs.GetStringKey("out")
print actionArgs.GetStringKey("trajout");
#for arg in actionArgs:
#    print arg

#print actionArgs.getKeyInt("psi1", 1)
#print actionArgs.GetStringKey("dihedral");
#print actionArgs.GetStringKey("parmout");
print actionArgs.hasKey("out");
#print actionArgs.Contains("out")
