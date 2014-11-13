#!/usr/bin/env python 

import sys
from glob import glob

if len(sys.argv) == 1:
    solist = glob("*.so")
    for fname in solist:
        modname = fname.split(".")[0]
        if not modname is "Atom":
            __import__(modname)
else:
    #specify modname by user
    modname = 'test_' + sys.argv[1]
    __import__(modname)
