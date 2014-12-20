import os
import pycpptraj
from importlib import import_module
#from pycpptraj.actions.Action_Dihedral import Action_Dihedral
#from pycpptraj.actions.Action_Radgyr import Action_Radgyr
#from pycpptraj.actions.Action_Strip import Action_Strip
#from pycpptraj.actions.Action_Rmsd import Action_Rmsd

#Action_Radgyr().help()

pylist = os.environ['PYCPPTRAJ_HOME'] + "/PYXLIST.txt"

actions = []
with open(pylist, 'r') as fh:
    lines = fh.readlines()
    for line in lines:
        if line.startswith("actions/"):
            try:
                actions.append(line.split("/")[-1].split()[0])
            except: pass

actions.remove("Action")

for act_name in actions:
    module = '.actions.' + act_name
    mod = import_module(module, package='pycpptraj')
    classname = mod.__getattribute__(act_name)
    print "Help for %s" % act_name
    classname().help()
    print
