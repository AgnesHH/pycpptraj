# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Topology cimport *
from DataSet cimport *
from Range cimport *
from ArgList cimport *


cdef extern from "DihedralSearch.h": 
    cdef cppclass DihedralSearch::DihedralMask "DihedralSearch::DihedralMask":
        DihedralMask() 
        DihedralMask(int, int, int, int, int, const string&, DihedralType)
        int A0() const 
        int A1() const 
        int A2() const 
        int A3() const 
        int ResNum() const 
        const string& Name() const 
        bint None() const 
        DihedralType Type() const 
    # DihedralSearch.h
    ctypedef enum DihedralType "DihedralSearch::DihedralType":
        PHI "DihedralSearch::PHI"
        PSI "DihedralSearch::PSI"
        CHIP "DihedralSearch::CHIP"
        OMEGA "DihedralSearch::OMEGA"
        ALPHA "DihedralSearch::ALPHA"
        BETA "DihedralSearch::BETA"
        GAMMA "DihedralSearch::GAMMA"
        DELTA "DihedralSearch::DELTA"
        EPSILON "DihedralSearch::EPSILON"
        ZETA "DihedralSearch::ZETA"
        NU1 "DihedralSearch::NU1"
        NU2 "DihedralSearch::NU2"
        CHIN "DihedralSearch::CHIN"
        NDIHTYPE "DihedralSearch::NDIHTYPE"
    cdef cppclass DihedralSearch "DihedralSearch":
        mask_it begin() const 
        mask_it end() const 
        int Ndihedrals() const 
        DihedralSearch() 
        void ListKnownTypes() 
        void OffsetHelp() 
        DihedralType GetType(const string&)
        int SearchFor(DihedralType)
        void SearchForArgs(ArgList&)
        int SearchForNewType(int, const string&, const string&, const string&, const string&, const string&)
        int SearchForAll() 
        int FindDihedrals(const Topology&, const Range&)
        void Clear() 
        void ClearFound() 
        void PrintTypes() 
        AtomMask MovingAtoms(const Topology&, int, int)
    cdef cppclass DihedralSearch::DihedralToken "DihedralSearch::DihedralToken":
        DihedralToken() : offset_(0 ), type_(NDIHTYPE)
        DihedralToken(int, const NameType&, const NameType&, const NameType&, const NameType&, const string&)
        DihedralToken(const DIH_TYPE&, DihedralType)
        DihedralMask FindDihedralAtoms(const Topology&, int)
        const string& Name() const 
        DihedralType Type() const 
        void SetAtomName(int i, const NameType& n)
