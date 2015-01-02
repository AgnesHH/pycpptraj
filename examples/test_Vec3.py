from pycpptraj.Vec3 import Vec3
import numpy as np

v1 = Vec3()
v1.Print("")
v1.SetVec(1., 2., 3.)
#v1.Print("updated v1")
print v1
assert v1.to_list() == [1.0, 2.0, 3.0]

print "v1 * 12 = %s" % (v1*12)

v2 = Vec3()
v2.SetVec(2., 4., 6.)
print "v2 = %s " % v2
print "v1*v2 = %s" %(v1*v2)
print "np.dot(v1, v2) = %s " % np.dot(v1.to_list(), v2.to_list())

print "v2[2] = %s" % (v2[2])

v2 *= 2.
v2.Print("v2 *= 2")

print "v2 - 2. = %s" % (v2 - 2.)
print "v2 + 2. = %s" % (v2 + 2.)

print "v1 = %s" % v1
print "v2 = %s" % v2
print "v2 - v1 = %s" % (v2 - v1)

print "v1.Cross(v2) = %s" % (v1.Cross(v2))
print np.cross([1.0, 2.0, 3.0],[4.0000, 8.0000, 12.0000])

v3 = Vec3(100, 1000, 10000)
print "Make v4 as copy of v3 (%s)" % (v3)
v4 = Vec3(v3)
print "v4 = %s" % v4

print "v3 and v4 are the same Vec3 instance? %s" % (v3 == v4)

import unittest

class Test(unittest.TestCase):
    def test_1(self):
        pass

if __name__ == "__main__":
    unittest.main()
