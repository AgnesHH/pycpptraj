"""this file has commonly used actions such as rmsd calculation, 
randomizeions, strip atoms, ..."""

from pycpptraj.Topology import Topology
from pycpptraj.Frame import Frame
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.FrameArray import FrameArray
from pycpptraj.actions import allactions

__all__ = ['strip', 'fit', 'get_subframe', 'randomize_ions']

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

    stripact = allactions.Action_Strip()
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

def fit(frame, ref=None):
    """fit Frame intance to reference Frame

    Parameters
    ---------
    frame : Frame instance
    ref : reference Frame (default = None)
    """
    if not ref:
        raise ValueError("missing reference Frame")
    else:
        # TODO : fitting
        pass

def get_subframe(frame=None, mask=None, top=None, atommask=None):
    # TODO : move to `io.py`
    return frame.get_subframe(mask=mask, top=top, atommask=atommask)


def randomize_ions(frame=Frame(), top=Topology(), command=""):
    """randomize_ions for given Frame with Topology
    Return : None
    Parameters
    ---------
    frame : Frame instance, default=Frame()
        frame coords will be modified

    top : Topology instance, default=Topology()

    >>> from pycpptraj.misc import randomize_ions
    >>> randomize_ions(frame, top, command="randomizeions @Na+ around :1-16 by 5.0 overlap 3.0")
    """
    act = allactions.Action_RandomizeIons()
    act.master(command=command,
               currenttop=top,
               currentframe=frame,
               )

def action_help(action=None):
    # where should we put this method? putting here seems not really reasonable
    from pycpptraj import allactions

    actlist = []

    for key in allactions.__dict__.keys():
        if "Action_" in key:
            act = key.split("_")[1]
            actlist.append(act)

    if action is None:
        print "give the name of Action to get help"
        print "action_help('RadGyr')"
        print actlist
    else:
        actname = "Action_" + action
        act = allactions.__dict__[actname]()
        act.help()
