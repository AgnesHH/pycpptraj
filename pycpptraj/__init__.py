"""
pycpptraj
"""
import os
from pycpptraj import base
from pycpptraj.misc import load, iterload

# TODO : should we load those module here or use .base?
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask

from pycpptraj.CpptrajState import CpptrajState

from pycpptraj.FrameList import FrameList
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.TopologyList import TopologyList
from pycpptraj.DataFileList import DataFileList
from pycpptraj.DataSetList import DataSetList

from pycpptraj.cast_dataset import cast_dataset

# actions
from pycpptraj.actions import allactions
from pycpptraj.analyses import allanalyses

try:
    amber_home = os.environ['AMBERHOME']
except:
    raise EnvironmentError("must set AMBERHOME")
