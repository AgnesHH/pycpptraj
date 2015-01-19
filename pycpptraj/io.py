from pycpptraj.base import *
from pycpptraj.iterload import _iterload
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.Trajin_Single import Trajin_Single as Trajectory
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Topology import Topology
from pycpptraj.trajs.Traj_PDBfile import Traj_PDBfile

__all__ = ['load', 'iterload', 'writetraj', 'readparm', 'writeparm']

def load(*args, **kwd):
    """try loading and returning appropriate values"""
    if len(args) + len(kwd) == 1:
        # loading only Topology
        return readparm(*args, **kwd)
    else:
        # load traj
        return loadtraj(*args, **kwd)

def iterload(filename=None, top=Topology(), start=0, chunk=None):
    """iterload(filename=None, top=Topology(), start=0, chunk=None)"""
    if not isinstance(top, Topology):
        # string
        top = Topology(top)
    return _iterload(top, filename, start, chunk)

def loadtraj(filename=None, top=Topology(), readonly=True):
    """load(filename=None, top=Topology(), readonly=True)"""
    if not isinstance(top, Topology):
        # string
        top = Topology(top)
    if readonly:
        ts = Trajin_Single()
    else:
        ts = FrameArray()
    ts.load(filename, top)
    return ts

def writetraj(filename="", traj=None, top=None, 
              fmt='UNKNOWN_TRAJ', indices=None,
              overwrite=False):
    """writetraj(filename="", traj=Trajectory(), top=Topology(), 
              ftm='AMBERTRAJ', indices=None):
    """
    if not traj or not top:
        raise ValueError("Need non-empty traj and top files")

    with Trajout(filename=filename, top=top, fmt=fmt, overwrite=overwrite) as trajout:
        if isinstance(traj, Frame):
            if indices is not None:
                raise ValueError("indices does not work with single Frame")
            trajout.writeframe(0, traj, top)
        else:
            if isinstance(traj, FrameArray) or isinstance(traj, Trajin_Single):
                traj2 = traj
            elif isinstance(traj, basestring):
                traj2 = load(traj, top)
            else:
                raise NotImplementedError("must be FrameArray, Trajin_Single or string")
            if not indices:
                # write all traj
                for idx, frame in enumerate(traj2):
                    trajout.writeframe(idx, frame, top)
            else:
                for idx in indices:
                    trajout.writeframe(idx, traj2[idx], top)

def writeparm(filename=None, top=None, fmt='AMBERPARM'):
    # TODO : add *args
    from pycpptraj.parms.ParmFile import ParmFile
    parm = ParmFile()
    parm.writeparm(filename=filename, top=top, fmt=fmt)

def readparm(filename):
    """return topology instance from reading filename"""
    return Topology(filename)
