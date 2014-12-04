# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Topology cimport *
from DataSet cimport *
from Range cimport *
from ArgList cimport *


cdef extern from "DihedralSearch.h": 
    cdef cppclass _DihedralSearch::DihedralMask "DihedralSearch::DihedralMask":
        DihedralMask() 
        DihedralMask(int, int, int, int, int, const string&, _DihedralType)
        int A0() const 
        int A1() const 
        int A2() const 
        int A3() const 
        int ResNum() const 
        const string& Name() const 
        bint None() const 
        _DihedralType Type() const 


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
    cdef cppclass _DihedralSearch "DihedralSearch":
        mask_it begin() const 
        mask_it end() const 
        int Ndihedrals() const 
        _DihedralSearch() 
        void ListKnownTypes() 
        void OffsetHelp() 
        _DihedralType GetType(const string&)
        int SearchFor(_DihedralType)
        void SearchForArgs(_ArgList&)
        int SearchForNewType(int, const string&, const string&, const string&, const string&, const string&)
        int SearchForAll() 
        int FindDihedrals(const _Topology&, const _Range&)
        void Clear() 
        void ClearFound() 
        void PrintTypes() 
        _AtomMask MovingAtoms(const _Topology&, int, int)


    cdef cppclass _DihedralSearch::DihedralToken "DihedralSearch::DihedralToken":
        DihedralToken() 
        DihedralToken(int, const _NameType&, const _NameType&, const _NameType&, const _NameType&, const string&)
        DihedralToken(const DIH_TYPE&, _DihedralType)
        DihedralMask FindDihedral_Atoms(const _Topology&, int)
        const string& Name() const 
        _DihedralType Type() const 
        void Set_AtomName(int i, const _NameType& n)


cdef class DihedralSearch::DihedralMask:
    cdef _DihedralSearch::DihedralMask* thisptr

cdef class DihedralSearch:
    cdef _DihedralSearch* thisptr

cdef class DihedralSearch::DihedralToken:
    cdef _DihedralSearch::DihedralToken* thisptr

