import numpy as np
from pycpptraj.actions.Action_Radgyr import Action_Radgyr
from pycpptraj.actions.Action_Molsurf import Action_Molsurf
from pycpptraj.actions.Action_Matrix import Action_Matrix
from pycpptraj.actions.Action_ClusterDihedral import Action_ClusterDihedral
from pycpptraj.CpptrajState import CpptrajState
from test_API.TestAPI import create_state, do_calculation

state = create_state(top="./data/Tc5b.top", trajin="./data/md1_prod.Tc5b.x", ref=None)
state.set_action_silence(True)
radgyr = do_calculation(action=Action_Radgyr(), input="gyr @CA", state=state)

print radgyr[:10]
# make sure to reprodce cpptraj output

state = create_state(top="./data/Tc5b.top", trajin="./data/md1_prod.Tc5b.x", ref=None)
mat = do_calculation(action=Action_Matrix(), input="matrix @CA", state=state)
print mat[:10]
