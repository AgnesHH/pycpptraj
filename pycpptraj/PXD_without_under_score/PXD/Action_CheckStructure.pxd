# distutils: language = c++
from libcpp.vector cimport vector
from Action cimport *
from ImagedAction cimport *


cdef extern from "Action_CheckStructure.h": 
    cdef cppclass Action_CheckStructure::Problem "Action_CheckStructure::Problem":
        Problem() : Dist_(0.0 ), frameNum_(- 1 ), type_(BOND ), atom1_(- 1 ), atom2_(- 1)
        Problem(int f): Dist_(0.0 ), frameNum_(f ), type_(BOND ), atom1_(- 1 ), atom2_(- 1)
        Problem(const Problem& rhs): Dist_(rhs Dist_ ), frameNum_(rhs frameNum_ ), type_(rhs type_ ), atom1_(rhs atom1_ ), atom2_(rhs atom2_)
    cdef cppclass Action_CheckStructure "Action_CheckStructure":
        Action_CheckStructure() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_CheckStructure() 
        RetType Init(ArgList&, TopologyList *, FrameList *, DataSetList *, DataFileList *, int)
        RetType Setup(Topology *, Topology * *)
        int CheckFrame(int, const Frame&)
        void Print() 
    cdef cppclass Action_CheckStructure::bond_list "Action_CheckStructure::bond_list":
    cdef cppclass Action_CheckStructure::bond_list_cmp "Action_CheckStructure::bond_list_cmp":
        inline bint operator()(const bond_list& first, const bond_list& second) const 
