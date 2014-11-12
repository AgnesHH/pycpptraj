# distutils: language = c++
from Action cimport *
from DihedralSearch cimport *


cdef extern from "Action_MakeStructure.h": 
    cdef cpplass _Action_MakeStructure::SS_TYPE "Action_MakeStructure::SS_TYPE":
        SS_TYPE() 
        SS_TYPE(double ph, double ps, double ph2, double ps2, int t, const string& n): phi(ph ), psi(ps ), phi2(ph2 ), psi2(ps2 ), isTurn(t ), type_arg(n)
        bint empty() 
