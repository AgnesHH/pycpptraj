import sys
from StringIO import StringIO
import numpy as np
from Matrix_3x3 import Matrix_3x3 as M3x3
from Vec3 import Vec3

# not work yet, damn
x = np.arange(1,10).astype(np.float64)
m = M3x3(x)
sys.stdout = StringIO()
#m.Print("3x3 matrix m: ")
out = sys.stdout
print help(out) 

#arr = np.loadtxt(out, skiprows=1)
#print arr
