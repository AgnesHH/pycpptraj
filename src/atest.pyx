#distutils: language = c++
from Vec3 cimport _Vec3
from Vec3_py import Vec3

def main():
    cdef _Vec3* ptr = new _Vec3(1.,2.,3.)
    ptr.Print("me")

    v = Vec3(1., 2., 3.) 
    v.thisptr.Print("me")
