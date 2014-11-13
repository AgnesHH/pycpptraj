# distutils: language = c++
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_CheckStructure.h": 
    cdef cppclass _Action_CheckStructure "Action_CheckStructure":
        Problem() : Dist_(0.0 ), frameNum_(- 1 ), type_(BOND ), atom1_(- 1 ), atom2_(- 1)
        Problem(int f): Dist_(0.0 ), frameNum_(f ), type_(BOND ), atom1_(- 1 ), atom2_(- 1)
        Problem(const Problem& rhs): Dist_(rhs Dist_ ), frameNum_(rhs frameNum_ ), type_(rhs type_ ), atom1_(rhs atom1_ ), atom2_(rhs atom2_)
