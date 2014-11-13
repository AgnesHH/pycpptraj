# distutils: language = c++
from MaskToken cimport *
from libcpp.vector cimport vector


cdef extern from "AtomMask.h": 
    cdef cppclass _AtomMask "AtomMask":
        _AtomMask()
        _AtomMask(const string&)
        _AtomMask(int, int)
        _AtomMask(int)
        _AtomMask(const _AtomMask &)
        #_AtomMask & operator =(const _AtomMask &)
        const vector [int]& Selected()const 
        #const_iterator begin()const 
        #const_iterator end()const 
        int back()const 
        int Nselected()const 
        const int & operator [ ](int idx)const 
        const char * MaskString()const 
        const string& MaskExpression()const 
        bint MaskStringSet()const 
        bint None()const 
        bint IsCharMask()const 
        void ResetMask()
        void ClearSelected()
        void InvertMask()
        int NumAtomsInCommon(const _AtomMask&)
        void AddSelected_Atom(int i)
        void Add_Atom(int)
        void Add_Atoms(const vector [int]&)
        void Add_Atom_Range(int, int)
        void AddMaskAtPosition(const _AtomMask&, int)
        void PrintMask_Atoms(const char *)const 
        int SetMaskString(const char *)
        int SetMaskString(const string&)
        void SetupIntMask(const char *, int, int)
        void SetupCharMask(const char *, int, int)
        bint _AtomInCharMask(int)const 
        bint _AtomsInCharMask(int, int)const 
        void SetNatom(int a)
        int ConvertToCharMask()
        int ConvertToIntMask()
        void MaskInfo()const 
        void BriefMaskInfo()const 
        #inline token_iterator begintoken()const 
        #inline token_iterator endtoken()const 
