from Vec3 cimport Vec3
from Matrix_3x3 cimport Matrix_3x3

ctypedef fused MatVecType:
    Vec3
    Matrix_3x3

