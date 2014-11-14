# distutils: language = c++
from NameType cimport *


cdef extern from "Residue.h": 
    cdef cppclass _Residue "Residue":
        _Residue()
        _Residue(int onum, const _NameType& resname, int first_AtomIn)
        inline void SetLast_Atom(int i)
        inline void SetOriginalNum(int i)
        inline int First_Atom() const 
        inline int Last_Atom() const 
        inline int OriginalResNum() const 
        inline const char * c_str() const 
        inline const _NameType& Name() const 
        inline int Num_Atoms() const 
        inline bint NameIsSolvent() const 
