# distutil: language = c++
from math import sqrt
from cpython.array cimport array
from pycpptraj.Frame cimport Frame, _Frame
#from pycpptraj.Vec3 cimport _Vec3, Vec3

def dist2_image_nonOrtho(Vec3 v1, Vec3 v2, Matrix_3x3 m1, Matrix_3x3 m2):
    return DIST2_ImageNonOrtho(v1.thisptr[0], v2.thisptr[0], m1.thisptr[0], m2.thisptr[0])

def dist_noimage(Vec3 v1, Vec3 v2):
    return DIST_NoImage(v1.thisptr[0], v2.thisptr[0])

#DIST2_ImageNonOrthoRecip(const _Vec3 &, const _Vec3&, double, int*, const _Matrix_3x3&)
#DIST2_ImageOrtho(const _Vec3&, const _Vec3&, const _Box &)
#DIST2_NoImage(const double*, const double*)
#DIST2_NoImage( const _Vec3&, const _Vec3& )
#DIST_NoImage( const _Vec3&, const _Vec3& )
#DIST2(const double*, const double*, ImagingType, const _Box &, 
#      const _Matrix_3x3&, const _Matrix_3x3&)

def distance(p1, p2, image=None, image_type=None, *args, **kwd):
    cdef Vec3 v1
    cdef Vec3 v2
    cdef double[:] arr1
    cdef double[:] arr2
    cdef int i

    if not image:
        if isinstance(p1, Vec3) and isinstance(p2, Vec3):
            v1 = <Vec3> p1
            v2 = <Vec3> p2
        else:
            v1 = Vec3(p1[0], p1[0], p1[1])
            v2 = Vec3(p2[0], p2[0], p2[1])
        return sqrt(DIST2_NoImage(v1.thisptr[0], v2.thisptr[0]))
    else:
        raise NotImplementedError("not yet supported")

def distance_frames(Frame f1, Frame f2, image=None, image_type=None, *args, **kwd):
    # TODO : extend this method
    cdef int i
    cdef array arr0 = array('d', [])

    if f1.n_atoms != f2.n_atoms:
        raise ValueError("two frames must have the same number of atoms")
    if not image:
        for i in range(f1.n_atoms):
            arr0.append(sqrt(DIST2_NoImage(f1.thisptr.XYZ(i), f2.thisptr.XYZ(i))))
    else:
        raise NotImplementedError("not yet supported for image")

    return arr0
