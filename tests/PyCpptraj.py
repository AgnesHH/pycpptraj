#!/usr/bin/env python
"""Get help: python ./PyCpptraj --help"""

import sys
from pycpptraj.cpptraj import Cpptraj

print sys.argv[:]
Cpptraj().run(sys.argv[:])

