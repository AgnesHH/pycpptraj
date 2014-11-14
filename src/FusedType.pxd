from Vec3 cimport *
from Matrix_3x3 cimport *

ctypedef fused MatVecType:
    Vec3
    Matrix_3x3

