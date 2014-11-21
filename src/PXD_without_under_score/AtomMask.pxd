# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from MaskToken cimport *


cdef extern from "AtomMask.h": 
    cdef cppclass AtomMask "AtomMask":
        AtomMask() 
        AtomMask(const string&)
        AtomMask(int, int)
        AtomMask(int)
        AtomMask(const AtomMask&)
        #AtomMask& operator =(const AtomMask&)
        const vector[int]& Selected() const 
        #const_iterator begin() const 
        #const_iterator end() const 
        int back() const 
        int Nselected() const 
        const int& operator[](int idx) const 
        const char * MaskString() const 
        const string& MaskExpression() const 
        bint MaskStringSet() const 
        bint None() const 
        bint IsCharMask() const 
        void ResetMask() 
        void ClearSelected() 
        void InvertMask() 
        int NumAtomsInCommon(const AtomMask&)
        void AddSelectedAtom(int i)
        void AddAtom(int)
        void AddAtoms(const vector[int]&)
        void AddAtomRange(int, int)
        void AddMaskAtPosition(const AtomMask&, int)
        void PrintMaskAtoms(const char *) const 
        int SetMaskString(const char *)
        int SetMaskString(const string&)
        void SetupIntMask(const char *, int, int)
        void SetupCharMask(const char *, int, int)
        bint AtomInCharMask(int) const 
        bint AtomsInCharMask(int, int) const 
        void SetNatom(int a)
        int ConvertToCharMask() 
        int ConvertToIntMask() 
        void MaskInfo() const 
        void BriefMaskInfo() const 
        #inline token_iterator begintoken() const 
        #inline token_iterator endtoken() const 
