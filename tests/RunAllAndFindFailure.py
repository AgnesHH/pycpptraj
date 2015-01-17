#!usr/bin/env python
import subprocess
from subprocess import Popen

import commands
txt = commands.getstatusoutput('sh ./TestListTravis.sh')

i = 0
if 'ERROR' in txt or 'error' in txt or 'Error' in txt:
    i += 1
print "%s ERRORs" % i
