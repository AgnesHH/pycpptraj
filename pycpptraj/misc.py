# check ./utils/actions.py
from pycpptraj.base import *
from pycpptraj.actions.Action_Strip import Action_Strip

def load_parm():
    pass

def strip(top, farray, mask):
    """
    Modify top and farray

    Strip atoms
    Parameters
    ---------
    Topology instance, or Frame instance, or Trajin_Single instance

    Out:
    ----
    Return : None
    """
    if top.n_atoms != farray.top.n_atoms:
        raise ValueError("top.n_atoms must be equal to farray.top.n_atoms")

    toplist = TopologyList()
    toplist.add_parm(top)
    stripact = Action_Strip()
    stripact.read_input(ArgList("strip " + mask), toplist)
    stripact.process(toplist[0], top)

    for i in range(farray.size):
        tmp = farray[i]
        stripact.do_action(tmp, i)
        farray[i] = tmp

    # not sure why we need to re-copy top 
    # if not, get  weird n_atoms
    farray.top = top.copy()
