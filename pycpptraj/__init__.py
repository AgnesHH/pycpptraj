"""
pycpptraj
"""
from pycpptraj.Topology import Topology
from pycpptraj.Frame import Frame
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.TopologyList import TopologyList
from pycpptraj.DataFileList import DataFileList
from pycpptraj.DataSetList import DataSetList
from pycpptraj.FrameList import FrameList
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.ReferenceFrame import ReferenceFrame
import os

try:
    amber_home = os.environ['AMBERHOME']
except:
    raise EnvironmentError("must set AMBERHOME")
