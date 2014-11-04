import numpy as np
from copy import deepcopy
from Matrix_3x3_py import Matrix_3x3 as M3x3

x = np.arange(9).astype(float)
m = M3x3(x)
m.Print("3x3 matrix m: ")

y = np.array([100.,]).astype(float)
n = M3x3(y)
n.Print("3x3 matrix n: ")

mcp = m.copy()

print mcp == m

mcp.Print("mcp matrix")
