# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from DihedralSearch cimport *


cdef extern from "Action_MakeStructure.h": 
    cdef cppclass Action_MakeStructure::SS_TYPE "Action_MakeStructure::SS_TYPE":
        SS_TYPE() 
        SS_TYPE(double ph, double ps, double ph2, double ps2, int t, const string& n): phi(ph ), psi(ps ), phi2(ph2 ), psi2(ps2 ), isTurn(t ), type_arg(n)
        bint empty() 
    cdef cppclass Action_MakeStructure::SecStructHolder "Action_MakeStructure::SecStructHolder":
        SecStructHolder() : sstype_idx(- 1)
        SecStructHolder(const string& rangearg, int typeidx): resRange(rangearg, - 1 ), sstype_idx(typeidx)
    cdef cppclass Action_MakeStructure "Action_MakeStructure":
        Action_MakeStructure() 
        DispatchObject * Alloc() 
        void Help() 
