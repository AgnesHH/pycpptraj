from pycpptraj.base import *
from pycpptraj.iterload import _iterload
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Trajin_Single import Trajin_Single as Trajectory
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Topology import Topology

__all__ = ['load', 'iterload', 'writetraj', 'readparm', 'writeparm']

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

def writetraj(fname=fname, traj=Trajectory(), top=Topology(), 
              ftm='AMBERTRAJ', indices=None):
    """write Frame or FrameArray"""
    trajout = Trajout()
    trajout.openfile(fname=fname, top=top, fmt=ftm)
    if indices:
        raise NotImplementedError("not yet supportted")
    if isinstance(traj, Frame):
        if indices is not None:
            raise ValueError("indices does not work with single Frame")
        trajout.writeframe(0, top, traj)
    elif isinstance(traj, FrameArray) or isinstance(traj, Trajin_Single):
        # assume that 0w
        for idx, frame in enumerate(traj):
            trajout.writeframe(idx, top, frame)
    trajout.closefile()

def writeparm(fname=None, top=None, fmt='AMBER'):
    # TODO : add *args
    from pycpptraj.ParmFile import ParmFile
    parm = ParmFile()
    parm.writeparm(fname=fname, top=top, fmt=fmt)

def readparm(fname):
    """return topology instance from reading filename"""
    return Topology(fname)
