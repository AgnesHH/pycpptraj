from StringIO import StringIO
import numpy as np
from copy import deepcopy
from Matrix_3x3 import Matrix_3x3 as M3x3
from Vec3 import Vec3

#out = StringIO()
vec = Vec3(np.array([1., 2., 3.]))
test = M3x3()
test.Print("test")
test.Print("test")

x = np.arange(1,10).astype(np.float64)
m = M3x3(x)
out = m.Print("3x3 matrix m: ")
print 'out will be "out"', out

mcopy = M3x3()
mcopy.copy(m)
mcopy.Print("Create mcopy matrix from m") 

print "Convert to python list"
print mcopy.to_list()

print "Convert to numpy matrix"
mat = mcopy.to_numpy_mat()
print type(mat)
print mat

#print "*"*20
#print "test StringIO"
#arr = np.loadtxt(skiprows=1, out)
#print "*"*20
#
#m2copy = M3x3.copy_mat(mcopy)
#m2copy.Print("Create mcopy matrix from m")
#
#y = np.array([100.,]).astype(np.float64)
#n = M3x3(y)
#n.Print("3x3 matrix n: ")
#
###test Set diagonal
#mdig = M3x3(np.array([1., 2., 3.]).astype(np.float64))
#mdig.Print("diagonal matrix: ")
#
###test returning Vector
##print "Row"
##m.Row1().Print("row1")
##m.Row2().Print("row2")
##m.Row3().Print("row3")
###
##print "Col"
##m.Col1().Print("col1")
##m.Col2().Print("col2")
##m.Col3().Print("col3")
##
###test matrix multiplication
#x2 = np.arange(9,0,-1).astype(float)
#m2 = M3x3(x2)
#print("Start multiplication")
#m.Print('m')
#print("")
#m2.Print('m2')
#m3 = m.mul(m2)
## can not implment m3 = m*m2 yet. Got KeyError: u'__pyx_fuse_0__mul__'
## when using fused type
#m3.Print("m3")
#
#m4 = m*m2
#m4.Print("m4 = m3?")
#print("")
#m *= m2
#m.Print("new m")
#
#print "Start TransposeMult matrix"
#m2.Print("m2")
#print
#m2.TransposeMult(m).Print("TransposeMult with a matrix")
#print 
#
#print "Test RotationMatrix"
## m2.CalcRotationMatrix(1., 2., 3., 4.) #ValueError
#m2.CalcRotationMatrix(1., 2., 3.,)
#m2.Print("new m2")
#
#m2.CalcRotationMatrix(vec, 0.5)
#m2.Print("new m2")
#
#print "RotationAngle"
#print m2.RotationAngle()
#
##test.Print("test")
