import numpy as np
from pycpptraj.Box import Box

boxin = np.array([1., 2., 3., 4. ,5. ,6.])
# create Box instance from np array
b = Box(boxin)

print "Original box"
print b.boxarr
print b.lengths
print b.center
print "has box? ", b.has_box()
print "b.TypeName: %s" % (b.TypeName)

print
print "b.SetTruncOct()"
b.SetTruncOct()
print b.boxarr
print b.Lengths
print b.Center
print "has box? ", b.has_box()
print "b.TypeName: %s" % (b.TypeName)
print
print "set and get properties"
b.BoxX = 1.1 
b.BoxY = 2.1 
b.BoxZ = 3.1 
b.Alpha = 4.1 
b.Beta = 5.1 
b.Gamma = 6.1 
print """b.BoxX = 1.1 
b.BoxY = 2.1 
b.BoxZ = 3.1 
b.Alpha = 4.1 
b.Beta = 5.1 
b.Gamma = 6.1"""

print b.boxarr

print "Test Box copy"
b2 = Box(b)
print b2 == b
print b2.boxarr
print
print "Test box indexing"
for i in range(6):
    print b2[i]

print 
print "Test iterator"
for b in b2:
    print b
#print
#print "b.SetNoBox()"
#b.SetNoBox()
#print b.boxarr
#print b.Lengths
#print b.Center
#print "has box? ", b.has_box()
#print "b.TypeName: %s" % (b.TypeName)
