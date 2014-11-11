#!/usr/bin/env python
#python ./find_class_name.py filename

import sys
import re
from glob import glob

def find_class():
    src = "/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"
    p = re.compile(r'#include "(.+?).h"')
    classlist = []
    
    for fname in glob(src + "*.h"):
        fnshort = fname.split("/")[-1]
        fh = open(fname, 'r')
        for line in fh.readlines():
            if line.startswith("class"):
                classname = line.split()[1].split(":")[0].split(";")[0]
                classlist.append(classname)
                #print "%s --> %s" % (fnshort, classname)
        fh.close()
    return list(set(classlist))

if __name__ == '__main__':
    classlist = find_class()
    for x in classlist:
        if (not x.startswith("Action")) and  (not x.startswith("Analysis")):
            print x
