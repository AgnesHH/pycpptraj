#!/usr/bin/env python 

import sys
from glob import glob

if not sys.argv[1]:
    solist = glob("*.so")
    modname = fname.split(".")[0]
    for fname in solist:
        if not modname is "Atom":
            __import__(modname)
else:
    #specify modname by user
    modname = sys.argv[1]
    __import__(modname)
