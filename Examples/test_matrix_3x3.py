import numpy as np
from copy import deepcopy
from Matrix_3x3_py import Matrix_3x3 as M3x3

x = np.arange(1,10).astype(float)
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

#test returning Vector
print "Row"
m.Row1().Print("row1")
m.Row2().Print("row2")
m.Row3().Print("row3")

print "Col"
m.Col1().Print("col1")
m.Col2().Print("col2")
m.Col3().Print("col3")

#test matrix multiplication
x2 = np.arange(9,0,-1).astype(float)
m2 = M3x3(x2)
print("Start multiplication")
m.Print('m')
print("")
m2.Print('m2')
m3 = m * m2
m3.Print("m3")
