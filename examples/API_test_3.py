from __future__ import with_statement
import numpy as np
from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Distance import Action_Distance

from test_API.TestAPI2 import create_state, do_calculation

state = create_state(top="./data/Tc5b.top", trajin="./data/md1_prod.Tc5b.x", ref=None)
state.set_no_progress()
#output = do_calculation(action=Action_Strip(), command="strip !@CA", state=state)
output = do_calculation(action=Action_Distance(), command="distance :2@CA :10@CA", state=state)

dlist = state.datasetlist
trajlist = state.get_trajinlist()
print trajlist
print dir(trajlist)
print dir(trajlist[0])
trajin = trajlist[0]
print trajin.current_frame
print trajin.start
print trajin.offset
print trajin.top.n_atoms
trajin.top = state.toplist[0]
print trajin.top.n_atoms
trajin.print_info_line()
print dlist[0]

frame = Frame(trajin.top.n_atoms)
print frame
#trajin.begin_traj()
#trajin.get_next_frame(frame)
#trajin.end_traj()

with trajin:
    trajin.get_next_frame(frame)

print np.asarray(frame[:10])
print frame.size
print frame.n_atoms

print "traji.max_frames = ", trajin.max_frames
i = 0
for traj in trajin:
    i += 1
print i

#gen = trajin.__iter__()
#frame2 = gen.next()
#print frame2
#print np.asarray(frame2[:10])
#print frame2.size
#print frame2.n_atoms
