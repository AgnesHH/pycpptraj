# distutil: language = c++

from Topology cimport *
from ImageTypes cimport *
cdef extern from "ImageRoutines.h" namespace "Image":
    PairType CreatePairList(const Topology&, Mode, AtomMask)
    Vec3 SetupTruncoct(const Frame&, AtomMask*, bint, bint)
    void Nonortho(Frame&, bint, const Vec3&, const Vec3&, const Matrix_3x3&
                  const Matrix_3x3&
                  bint, bint, bint, const PairType&)
    Vec3 Nonortho(const Vec3&, bint, bint
                  const Matrix_3x3&, const Matrix_3x3&, const Vec3&, double)
    int SetupOrtho(const Box&, Vec3&, Vec3&, bint)
    void Ortho(Frame&, const Vec3&, const Vec3&, const Vec3&,
              bint, bint, const PairType&)
    Vec3 Ortho(const Vec3&, const Vec3&, const Vec3&, const Box&)
    void UnwrapNonortho(Frame&, Frame&, const PairType&,
                       const Matrix_3x3&, const Matrix_3x3&, bint, bint)
    void UnwrapOrtho(Frame&, Frame&, const PairType&, bint ,bint)

