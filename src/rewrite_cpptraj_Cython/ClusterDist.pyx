# distutils: language = c++

cdef double DistCalc_Dih(double d1, double d2):
    cdef double diff = fabs(d1 - d2)

    if diff > 180.:
        return 360. - diff
    else:
        return diff

cdef double DistCalc_Std(double d1, double d2):
    return fabs(d1 - d2)

cdef double AvgCalc_Dih(DataSet_1D dsIn, Cframes cframesIn):
    cdef double sumy = 0.0
    cdef double sumx = 0.0


