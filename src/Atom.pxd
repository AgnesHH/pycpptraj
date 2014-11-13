# distutils: language = c++
from NameType cimport *
from libcpp.vector cimport vector
from libcpp.set cimport set 

#do we need to define iterator here?
cdef extern from "Atom.h": 
    ctypedef enum _AtomicElementType "Atom::AtomicElementType":
        pass
    cdef cppclass _Atom "Atom":
        _Atom() 
        _Atom(const _NameType&, char, const char *)
        _Atom(const _NameType&, const _NameType&, double)
        _Atom(const _NameType&, double, double, const _NameType&)
        _Atom(const _NameType&, double, double, int, double, int, const _NameType&, double, double)
        _Atom(const _Atom &)
        void swap(_Atom &, _Atom &)
        #_Atom & operator =(_Atom)
        #inline bond_iterator bondbegin() const 
        #inline bond_iterator bondend() const 
        #inline excluded_iterator excludedbegin() const 
        #inline excluded_iterator excludedend() const 
        void SetResNum(int resnumIn)
        void SetMol(int molIn)
        void SetCharge(double qin)
        void SetGBradius(double rin)
        inline bint NoMol() const 
        inline const char * c_str() const 
        inline int ResNum() const 
        inline _AtomicElementType Element() const 
        inline int _AtomicNumber() const 
        inline const char * ElementName() const 
        inline const _NameType & Name() const 
        inline const _NameType & Type() const 
        inline int TypeIndex() const 
        inline int MolNum() const 
        inline char ChainID() const 
        inline int Nbonds() const 
        inline int Nexcluded() const 
        inline double Mass() const 
        inline double Charge() const 
        inline double Polar() const 
        inline double GBRadius() const 
        inline double Screen() const 
        void AddBond(int)
        void ClearBonds() 
        void SortBonds() 
        void AddExclusionList(const set[int] &)
        double GetBondLength(_AtomicElementType, _AtomicElementType)

cdef class Atom:
    cdef _Atom* thisptr
