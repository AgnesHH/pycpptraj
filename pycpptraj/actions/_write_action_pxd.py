import re
from glob import glob

pxdlist = glob("Action_*.pxd")
print pxdlist

for action in pxdlist:
#for action in [pxdlist[0],]:
    with open(action, 'r') as f0:
        txt = f0.read()

    oldline = "from pycpptraj.actions.Action cimport _Action, Action, FunctPtr"
    newline = "from pycpptraj.actions.Action cimport _Action, Action, FunctPtr, _DispatchObject"
    txt = txt.replace(oldline, newline)
    
    fname = "bk/" + action
    with open(fname, 'w') as fh:
        fh.writelines(txt)
