import os
import pycpptraj
from pycpptraj.TopologyList import TopologyList 
from pycpptraj.Residue import Residue

datadir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
tl = TopologyList()
tl.add_parm_file(datadir + "Tc5b.top")
tl.add_parm_file(datadir + "HP36.top")
#tl.List()
top = tl.get_parm(1)

print "get 1st residue"
res1 = top.res_generator().next()

# get residue's name
print res1
#print help(res1)
# extract residue info
print "1st atom: %s" % res1.first_atom
print "last atom: %s" % res1.last_atom
print res1.original_res_num
#print res1.c_str()
#print res1.Name()
print res1.NAtoms
#print res1.NameIsSolvent()

# print all residue's name in top file
#for res in top.res_generator():
#    print res

# test iterator
gen = top.res_generator()
print gen.next()
print gen.next()
print gen.next()
print gen.next()
print gen.next()
print gen.next()
