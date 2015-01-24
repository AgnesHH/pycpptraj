"""
import baseclasses for pycpptraj
"""
# TODO : make this file shorter
import sys

from pycpptraj.Atom import Atom
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.FrameArray2 import FrameArray2 
from pycpptraj.FrameArray2 import FrameArray2 as Trajectory
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.FrameList import FrameList
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.TrajReadOnly import TrajReadOnly
from pycpptraj.trajs.Trajout import Trajout
from pycpptraj.TrajinList import TrajinList
from pycpptraj.TopologyList import TopologyList
from pycpptraj.DataFileList import DataFileList
from pycpptraj.DataSetList import DataSetList
from pycpptraj.ActionList import ActionList
from pycpptraj.cast_dataset import cast_dataset
from pycpptraj import cpptraj_dict
from pycpptraj.parms.Parm_Amber import Parm_Amber



# `Trajectory` is alias of `FrameArray`
__all__ = ['Atom',
           'Topology', 'TopologyList', 
           'Frame', 'FrameArray', 
           'ReferenceFrame', 'AtomMask', 
           'ArgList', 'CpptrajState', 
           'FrameList', 'TrajReadOnly', 
           'DataSetList', 'DataFileList', 
           'ActionList',
           'Trajout', 'TrajinList',
           'Trajectory',
           'FrameArray2',
           'Parm_Amber', 
           'cast_dataset',
           'cpptraj_dict']
