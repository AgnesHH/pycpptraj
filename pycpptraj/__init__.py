"""
pycpptraj
"""
import os

try:
    amber_home = os.environ['AMBERHOME']
except:
    raise EnvironmentError("must set AMBERHOME")

try:
    from pycpptraj.Topology import Topology
except:
    raise EnvironmentError("make sure to set LD_LIBRARY_PATH to $AMBERHOME/lib")
