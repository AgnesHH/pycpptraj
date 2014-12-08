import sys
from pycpptraj.pycpptraj import cpptraj

print sys.argv[1:]
cpptraj(sys.argv[1:])
