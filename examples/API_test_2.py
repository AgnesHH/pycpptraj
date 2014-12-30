import os
import numpy as np
from pycpptraj import ArgList
from pycpptraj._cast import cast_dataset
from pycpptraj.actions.Action_Radgyr import Action_Radgyr
from pycpptraj.actions.Action_Molsurf import Action_Molsurf
from pycpptraj.actions.Action_Matrix import Action_Matrix
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.actions.Action_Matrix import Action_Matrix
from pycpptraj.actions.Action_ClusterDihedral import Action_ClusterDihedral
from pycpptraj.CpptrajState import CpptrajState
from test_API.TestAPI import create_state, do_calculation

testdir = os.environ['PYCPPTRAJ_HOME'] + "/tests/Cpptraj_test/"
topfile = testdir + "Test_Matrix/1rrb_vac.prmtop"
trajinfile = testdir + "Test_Matrix/1rrb_vac.mdcrd"
#testdir = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/"
#topfile = testdir + "Tc5b.top"
#trajinfile = testdir + "md1_prod.Tc5b.x"

state = create_state(top=topfile, trajin=trajinfile, ref=None)
#state.add_action(Action_Molsurf(), ArgList("surf"))
#state.add_action(Action_Molsurf(), ArgList("surf @CA"))
#state.add_action(Action_Matrix(), ArgList("matrix dist @CA byres out test_mat.dat"))
state.add_action(Action_Matrix(), ArgList("matrix dist @CA out mtest.0.dat byres"))
state.run()

#d1 = cast_dataset(state.datasetlist[0], dtype="dataset_matrixdbl")
d1 = cast_dataset(state.datasetlist[0], dtype="dataset_2d")
print d1.n_rows
print d1.n_cols
print d1.kind
print d1.type
Nlen = d1.n_cols * d1.n_rows
#print d1.element(0, 0)
#print d1.vect()
data = np.asarray(d1.data)
# wrong result
print data[:Nlen/2]
#
#d1np = np.asarray(d1.data)
#d2np = np.asarray(d2.data)
#print d1np
#print d2np

#trajinlist = state.get_trajinlist()
#t1 = trajinlist.front()
#print t1.top
#t1.top.summary()
