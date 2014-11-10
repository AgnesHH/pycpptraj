#!/usr/bin/env python
#python ./find_class_name.py filename

import sys
import re
from glob import glob

src = "/mnt/raidc/haichit/AMBER14_official.naga84.forPythonTest/AmberTools/src/cpptraj/src/"
p = re.compile(r'#include "(.+?).h"')
fh = open(src + sys.argv[1], 'r')

print "# distutils: language = c++"
print

for line in fh.readlines():
    if line.startswith("#include") and not line.startswith("#include <"):
        print 'from ' + re.findall(p, line)[0] + ' cimport *'

fh.close()
