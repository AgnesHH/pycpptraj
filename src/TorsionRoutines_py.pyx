# distutil: language = c++

#cdef extern from "TorsionRoutines.h":
#    double _Torsion "Torsion"(const double *, const double *, const double *, const double *)
#    double _Pucker_AS "Pucker_AS"(const double*, const double*, const double*, const double*,
#                                  const double*, double&)
#    double _Pucker_CP "Pucker_CP"(const double*, const double*, const double*, const double*,
#                                  const double*, const double*, int, double&, double&)
#    double _CalcAngle "CalcAngle"(const double*, const double*, const double*)


def Torsion(const double[:] x, const double[:] y, const double[:] z, const double[:] t ):
    return _Torsion(&x[0], &y[0], &z[0], &t[0] )

