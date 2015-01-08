#check ./utils/actions.py
from pycpptraj.base import *
from pycpptraj._iterload import _iterload
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.Trajin_Single import Trajin_Single

def iterload(top=None, traj=None, start=0, chunk=None):
    '''Iterately return Frame instance'''
    print top, traj, start, chunk
    return _iterload(top, traj, start, chunk)

def strip(arg, mask):
    """
    TODO: can not modify oldtop, Python to pass it as value
    TODO: validate
    Modify top and farray

    Strip atoms
    Parameters
    ---------
    Topology instance, or Frame instance, or Trajin_Single instance

    Out:
    ----
    Return : None
    """
    if isinstance(arg, Topology):
        top = arg.copy()
    elif isinstance(arg, FrameArray):
        top = arg.top.copy()

    toplist = TopologyList()
    toplist.add_parm(top)

    stripact = Action_Strip()
    stripact.read_input(ArgList("strip " + mask), toplist)
    stripact.process(toplist[0], top)

    if isinstance(arg, FrameArray):
        for i in range(arg.size):
            tmp = arg[i]
            stripact.do_action(tmp, i)
            arg[i] = tmp
        # need to update arg.top
        arg.top = top.copy()

    if isinstance(arg, Topology):
        return top.copy()
