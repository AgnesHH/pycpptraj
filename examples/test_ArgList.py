from ArgList import ArgList as AL

arglist = """
trajin ../../output_md1_prod/md1_prod.x 1 20000
dihedral psi1 :1@N :1@CA :1@C :2@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat 
dihedral phi2 :1@C :2@N :2@CA :2@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral psi2 :2@N :2@CA :2@C :3@N out PHIPSI_time_psi1_phi2_psi2_phi3.dat
dihedral phi3 :2@C :3@N :3@CA :3@C out PHIPSI_time_psi1_phi2_psi2_phi3.dat
go
"""
c = AL(arglist)
#for sinput in c:
#    print sinput
#print c.ArgLine()
#print c.CommandIs("dihedral")
#print c.CommandIs("out")
print c.getNextTag()
print c.getNextInteger(2)
print c.getNextInteger(10)
#c1 = AL()
#c2 = AL("trajout trajout.x @CA, C, N")
#c3 = AL("test1")
#c4 = AL(c2)
#
#for sinput in c2:
#    print sinput
#
#print "----------------------"
##print c2.ArgLine()
#
#print c2.CommandIs("test")
#print c2.CommandIs("trajout")
