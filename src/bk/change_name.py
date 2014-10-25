#change *_pxd.pxd to *.pxd

import os
from glob import glob
import re

for fname in glob("*_pxd.pxd"):
    fnewname = re.sub() 
    os.rename(fname, fnewname)
    

