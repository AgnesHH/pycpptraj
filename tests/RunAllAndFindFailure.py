#!usr/bin/env python
import subprocess
from subprocess import Popen

import commands
txt = commands.getstatusoutput('sh ./TestListTravis.sh')
i = 0
if 'ERROR' in txt:
    i += 1
print "%s ERRORs" % i
