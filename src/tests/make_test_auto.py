#!/usr/bin/env python
# automatically make simple test file (*.pyx)
import sys
from glob import glob

print type(sys.argv[0])
template = """
# distutils: language = c++
# this test file was automatically generated by %s
from %s cimport *

cdef _%s * p = new _%s()

del p
"""
current_test_files = [x.split("_")[1].split(".")[0] for x in glob("test_*.pyx")]
for fn in glob("../*pxd"):
    # Example: fn = ../Action_CreateReservoir.pxd
    # we need to exclude "../" and ".pxd"
    fname = fn.split("/")[-1].split(".")[0]
    if fname not in current_test_files:
        # only create non-existed files
        truefname = "test_" + fname + ".pyx"
        with open(truefname, 'w') as f:
            lines = template % (sys.argv[0], fname, fname, fname)
            f.writelines(lines) 