#!/usr/bin/env python
"""Get help: python ./PyCpptraj --help"""

import sys
from pycpptraj.cpptraj import cpptraj

print sys.argv[:]
cpptraj().run(sys.argv[:])
