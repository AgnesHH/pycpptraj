from pycpptraj.base import *
from pycpptraj.iterload import _iterload
from pycpptraj.actions.Action_Strip import Action_Strip
from pycpptraj.TrajReadOnly import TrajReadOnly
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
        ts = TrajReadOnly()
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
    # TODO : support list (tuple) of FrameArray, TrajReadOnly or 
    # list of filenames

    if not traj or not top:
        raise ValueError("Need non-empty traj and top files")

    with Trajout(filename=filename, top=top, fmt=fmt, overwrite=overwrite) as trajout:
        if isinstance(traj, Frame):
            if indices is not None:
                raise ValueError("indices does not work with single Frame")
            trajout.writeframe(0, traj, top)
        else:
            if isinstance(traj, basestring):
                traj2 = load(traj, top)
            else:
                traj2 = traj

            if indices is None:
                # write all traj
                for idx, frame in enumerate(traj2):
                    trajout.writeframe(idx, frame, top)
            else:
                if isinstance(traj2, (list, tuple)):
                    raise NotImplementedError("must be FrameArray or TrajReadOnly instance")
                for idx in indices:
                    #print "test writing indices"
                    trajout.writeframe(idx, traj2[idx], top)

def writeparm(filename=None, top=None, fmt='AMBERPARM'):
    # TODO : add *args
    from pycpptraj.parms.ParmFile import ParmFile
    parm = ParmFile()
    parm.writeparm(filename=filename, top=top, fmt=fmt)

def readparm(filename):
    """return topology instance from reading filename"""
    return Topology(filename)

def loadpdb_rcsb(pdbid):
    """load pdb file from rcsb website and convert to Topology instance"""
    import urllib
    url = 'http://www.rcsb.org/pdb/files/%s.pdb' % pdbid
    txt = urllib.urlopen(url).read()
    with open("_tmp", 'w') as fh:
        fh.write(txt)
    top = readparm("_tmp")
    frames = load("_tmp", top)
    return top, frames
