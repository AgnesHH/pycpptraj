from pycpptraj.base import *
from pycpptraj.iterload import _iterload
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Trajin_Single import Trajin_Single as Trajectory
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Topology import Topology

__all__ = ['load', 'iterload', 'writetraj', 'readparm', 'writeparm']

def iterload(fname=None, top=Topology(), start=0, chunk=None):
    """iterload(fname=None, top=Topology(), start=0, chunk=None)"""
    if not isinstance(top, Topology):
        # string
        top = Topology(top)
    return _iterload(top, fname, start, chunk)

def load(fname=None, top=Topology(), readonly=True):
    """load(fname=None, top=Topology(), readonly=True)"""
    if not isinstance(top, Topology):
        # string
        top = Topology(top)
    if readonly:
        ts = Trajin_Single()
    else:
        ts = FrameArray()
    ts.load(fname, top)
    return ts

def writetraj(fname="", traj=Trajectory(), top=Topology(), 
              fmt='AMBERTRAJ', indices=None):
    """writetraj(fname="", traj=Trajectory(), top=Topology(), 
              ftm='AMBERTRAJ', indices=None):
    """
    with Trajout(fname=fname, top=top, fmt=fmt) as trajout:
        if isinstance(traj, Frame):
            if indices is not None:
                raise ValueError("indices does not work with single Frame")
            trajout.writeframe(0, traj, top)
        elif isinstance(traj, FrameArray) or isinstance(traj, Trajin_Single):
            # assume
            if not indices:
                # write all traj
                for idx, frame in enumerate(traj):
                    trajout.writeframe(idx, frame, top)
            else:
                for idx in indices:
                    trajout.writeframe(idx, traj[idx], top)

def writeparm(fname=None, top=None, fmt='AMBERPARM'):
    # TODO : add *args
    from pycpptraj.parms.ParmFile import ParmFile
    parm = ParmFile()
    parm.writeparm(fname=fname, top=top, fmt=fmt)

def readparm(fname):
    """return topology instance from reading filename"""
    return Topology(fname)
