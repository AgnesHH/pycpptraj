"""
import baseclasses for pycpptraj
"""
# TODO : make this file shorter
from pycpptraj.Frame import Frame
from pycpptraj.FrameArray import FrameArray
from pycpptraj.FrameArray2 import FrameArray2 
from pycpptraj.FrameArray2 import FrameArray2 as Trajectory
from pycpptraj.FrameArray2 import FrameArray2 as TrajectoryReadOnly
from pycpptraj.ReferenceFrame import ReferenceFrame
from pycpptraj.Topology import Topology
from pycpptraj.ArgList import ArgList
from pycpptraj.AtomMask import AtomMask
from pycpptraj.CpptrajState import CpptrajState
from pycpptraj.FrameList import FrameList
from pycpptraj.Trajin_Single import Trajin_Single
from pycpptraj.FrameArray import FrameArray as Trajectory
from pycpptraj.trajs.Trajin import Trajin
from pycpptraj.trajs.Trajout import Trajout
from pycpptraj.TrajinList import TrajinList
from pycpptraj.TopologyList import TopologyList
from pycpptraj.DataFileList import DataFileList
from pycpptraj.DataSetList import DataSetList
from pycpptraj.ActionList import ActionList
from pycpptraj._cast import cast_dataset
from pycpptraj._iterload import _iterload
from pycpptraj import cpptraj_dict
from pycpptraj.parms.Parm_Amber import Parm_Amber

# `Trajectory` is alias of `FrameArray`
__all__ = ['Topology', 'TopologyList', 
           'Frame', 'FrameArray', 
           'ReferenceFrame', 'AtomMask', 
           'ArgList', 'CpptrajState', 
           'FrameList', 'Trajin_Single', 
           'DataSetList', 'DataFileList', 'ActionList',
           'Trajin', 'Trajout', 'TrajinList',
           'Trajectory',
           'TrajectoryReadOnly',
           'FrameArray2',
           'Parm_Amber', 
           'cast_dataset',
           '_iterload',
           'cpptraj_dict']
