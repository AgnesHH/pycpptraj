# distutils: language = c++


cdef extern from "Molecule.h": 
    cdef cppclass Molecule "Molecule":
        Molecule() 
        Molecule(int begin, int end)
        void SetFirst(int begin)
        void SetLast(int last)
        void SetSolvent() 
        void SetNoSolvent() 
        inline int BeginAtom() const 
        inline int EndAtom() const 
        inline bint IsSolvent() const 
        inline int NumAtoms() const 
