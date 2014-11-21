# distutils: language = c++
from NameType cimport *


cdef extern from "Residue.h": 
    cdef cppclass Residue "Residue":
        Residue() : firstAtom_(0 ), lastAtom_(0 ), resname_("")
        Residue(int onum, const NameType& resname, int firstAtomIn): firstAtom_(firstAtomIn ), originalResNum_(onum ), resname_(resname)
        inline void SetLastAtom(int i)
        inline void SetOriginalNum(int i)
        inline int FirstAtom() const 
        inline int LastAtom() const 
        inline int OriginalResNum() const 
        inline const char * c_str() const 
        inline const NameType& Name() const 
        inline int NumAtoms() const 
        inline bint NameIsSolvent() const 
