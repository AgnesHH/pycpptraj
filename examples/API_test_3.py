from __future__ import with_statement
import numpy as np
from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Distance import Action_Distance

from test_API.TestAPI2 import create_state, do_calculation

state = create_state(top="./data/Tc5b.top", trajin="./data/md1_prod.Tc5b.x", ref=None)
state.add_trajout("./out.x")
state.set_no_progress()
output = do_calculation(action=Action_Strip(), command="strip !@CA", state=state)
trajlist0 = output.get_trajinlist()
trajlist = state.get_trajinlist()

print trajlist0, trajlist
traj = trajlist[0]
print traj.size
print traj.is_empty()
print traj.top.n_atoms
traj.top = Topology("./data/Tc5b.top")
print traj.top.n_atoms
print traj.current_frame
print traj[0].n_atoms

dflist = state.datafilelist
dslist = state.datasetlist
print dir(dflist)
print dir(dslist)
print dslist.is_empty()
print dslist.size
print dir(state)
