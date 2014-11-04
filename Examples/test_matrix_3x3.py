import numpy as np
from copy import deepcopy
from Matrix_3x3_py import Matrix_3x3 as M3x3

x = np.arange(9).astype(float)
m = M3x3(x)
m.Print("3x3 matrix m: ")

y = np.array([100.,]).astype(float)
n = M3x3(y)
n.Print("3x3 matrix n: ")

mcp = M3x3()

#copy matrix "m" to mcp
mcp.copy(m)
mcp.Print("mcp matrix")

print "mcp is equal to m? ", mcp == m

#test Set diagonal
mdig = M3x3(np.array([1., 2., 3.]))
mdig.Print("diagonal matrix: ")

