# distutil: language = c++

def DIST2_ImageNonOrtho(Vec3 v1, Vec3 v2, Matrix_3x3 m1, Matrix_3x3 m2):
    return _DIST2_ImageNonOrtho(v1.thisptr[0], v2.thisptr[0], m1.thisptr[0], m2.thisptr[0])

def DIST_NoImage(Vec3 v1, Vec3 v2):
    return _DIST_NoImage(v1.thisptr[0], v2.thisptr[0])

#DIST2_ImageNonOrthoRecip(const _Vec3 &, const _Vec3&, double, int*, const _Matrix_3x3&)
#DIST2_ImageOrtho(const _Vec3&, const _Vec3&, const _Box &)
#DIST2_NoImage(const double*, const double*)
#DIST2_NoImage( const _Vec3&, const _Vec3& )
#DIST_NoImage( const _Vec3&, const _Vec3& )
#DIST2(const double*, const double*, ImagingType, const _Box &, 
#      const _Matrix_3x3&, const _Matrix_3x3&)
