import os
import numpy as np
from pycpptraj import ArgList
from pycpptraj._cast import cast_dataset
from pycpptraj.actions.Action_Radgyr import Action_Radgyr
from pycpptraj.actions.Action_Molsurf import Action_Molsurf
from pycpptraj.actions.Action_Matrix import Action_Matrix
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_ClusterDihedral import Action_ClusterDihedral
from pycpptraj.CpptrajState import CpptrajState
from test_API.TestAPI import create_state, do_calculation

testdir = os.environ['PYCPPTRAJ_HOME'] + "/tests/Cpptraj_test/"
topfile = testdir + "DPDP.parm7"
trajinfile = testdir + "DPDP.nc"

state = create_state(top=topfile, trajin=trajinfile, ref=None)
state.add_action(Action_Molsurf(), ArgList("surf"))
state.add_action(Action_Molsurf(), ArgList("surf @CA"))
#state.run()

#d1 = cast_dataset(state.datasetlist[0], dtype="dataset_double")
#d2 = cast_dataset(state.datasetlist[1], dtype="dataset_double")
#
#d1np = np.asarray(d1.data)
#d2np = np.asarray(d2.data)
#print d1np
#print d2np

trajinlist = state.get_trajinlist()
t1 = trajinlist.front()
print t1.top
t1.top.summary()
