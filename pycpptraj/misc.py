#check ./utils/actions.py
from pycpptraj.base import *
from pycpptraj._iterload import _iterload
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Topology import Topology

def iterload(top=None, fname=None, start=0, chunk=None):
    '''Iterately return Frame instance'''
    if not isinstance(top, Topology):
        # string
        top = Topology(top)
    return _iterload(top, fname, start, chunk)

def load(top=None, fname=None, readonly=True):
    if not isinstance(top, Topology):
        # string
        top = Topology(top)
    if readonly:
        ts = Trajin_Single()
    else:
        ts = FrameArray()
    ts.load(fname, top)
    return ts

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

def write_output(fname, frames, top, ftm='AMBERTRAJ'):
    """write Frame or FrameArray"""
    trajout = Trajout()
    trajout.openfile(fname=fname, top=top, fmt=ftm)
    if isinstance(frames, Frame):
        trajout.writeframe(0, top, frames)
    elif isinstance(frames, FrameArray) or isinstance(frames, Trajin_Single):
        # assume that 0w
        for idx, frame in enumerate(frames):
            trajout.writeframe(idx, top, frame)
    trajout.closefile()
