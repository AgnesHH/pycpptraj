# distutil: language = c++

from Box cimport *

cdef extern from "DistRoutines.h":
    ctypedef enum ImagingType:
        dNOIMAGE "NOIMAGE"=0 
        dORTHO "ORTHO"
        dNONORTHO "NONORTHO"
    double DIST2_ImageNonOrtho(const Vec3 &, const Vec3 &, const Matrix_3x3 &, const Matrix_3x3 &);
    double DIST2_ImageNonOrthoRecip(const Vec3 &, const Vec3&, double, int*, const Matrix_3x3&);
    double DIST2_ImageOrtho(const Vec3&, const Vec3&, const Box &);
    double DIST2_NoImage(const double*, const double*);
    double DIST2_NoImage( const Vec3&, const Vec3& );
    double DIST_NoImage( const Vec3&, const Vec3& );
    double DIST2(const double*, const double*, ImagingType, const Box &, 
                 const Matrix_3x3&, const Matrix_3x3&);
