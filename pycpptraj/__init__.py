"""
pycpptraj
"""
import os
from pycpptraj import base

# TODO : should we load those module here or use .base?
from pycpptraj import io
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.Topology import Topology
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.TrajReadOnly import TrajReadOnly
from pycpptraj.Trajectory import Trajectory
from pycpptraj.trajs.Trajout import Trajout
from pycpptraj.cast_dataset import cast_dataset
from pycpptraj.parms.ParmFile import ParmFile

# actions
from pycpptraj.actions import allactions
from pycpptraj.analyses import allanalyses

try:
    amber_home = os.environ['AMBERHOME']
except:
    raise EnvironmentError("must set AMBERHOME")
