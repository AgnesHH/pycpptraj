# distutils: language = c++
from NameType cimport *


cdef extern from "Residue.h": 
    cdef cppclass Residue "Residue":
        Residue() 
        Residue(int onum, const NameType& resname, int firstAtomIn)
        inline void SetLastAtom(int i)
        inline void SetOriginalNum(int i)
        inline int FirstAtom() const 
        inline int LastAtom() const 
        inline int OriginalResNum() const 
        inline const char * c_str() const 
        inline const NameType& Name() const 
        inline int NumAtoms() const 
        inline bint NameIsSolvent() const 
