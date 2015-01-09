from __future__ import with_statement
import numpy as np
from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Distance import Action_Distance

from test_API.TestAPI2 import create_state, do_calculation

state = create_state(top="./data/Tc5b.top", trajin="./data/md1_prod.Tc5b.x", ref=None)
#state.add_trajout("./out.x")
#state.add_trajout("./out.x netcdf")
state.set_no_progress()
#output = do_calculation(action=Action_Strip(), command="strip !@CA", state=state)
output = do_calculation(action=Action_Distance(), command="distance :2@CA :3@CA", state=state)
print output
dslist = state.datasetlist
print dslist.size

d0 = dslist[0]
print dir(d0)
