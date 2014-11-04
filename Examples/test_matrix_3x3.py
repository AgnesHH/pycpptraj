from Matrix_3x3_py import Matrix_3x3 as M3x3
import numpy as np

x = np.arange(9).astype(float)
m = M3x3(x)
m.Print("3x3 matrix m: ")

y = np.array([100.,]).astype(float)
n = M3x3(y)
n.Print("3x3 matrix n: ")
