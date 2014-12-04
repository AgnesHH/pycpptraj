# distutils: language = c++


cdef extern from "Molecule.h": 
    cdef cppclass Molecule "Molecule":
        Molecule() : beginAtom_(0 ), endAtom_(0 ), isSolvent_(false)
        Molecule(int begin, int end): beginAtom_(begin ), endAtom_(end ), isSolvent_(false)
        void SetFirst(int begin)
        void SetLast(int last)
        void SetSolvent() 
        void SetNoSolvent() 
        inline int BeginAtom() const 
        inline int EndAtom() const 
        inline bint IsSolvent() const 
        inline int NumAtoms() const 
