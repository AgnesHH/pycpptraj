# distutils: language = c++
from Action cimport *
from DihedralSearch cimport *


cdef extern from "Action_MakeStructure.h": 
    cdef cppclass _Action_MakeStructure "Action_MakeStructure":
        SS_TYPE() 
        SS_TYPE(double ph, double ps, double ph2, double ps2, int t, const string& n)
        bint empty() 
