# distutils: language = c++


cdef extern from "Molecule.h": 
    cdef cpplass _Molecule "Molecule":
        _Molecule() : begin_Atom_(0 ), end_Atom_(0 ), isSolvent_(false)
        _Molecule(int begin, int end): begin_Atom_(begin ), end_Atom_(end ), isSolvent_(false)
        void SetFirst(int begin)
        void SetLast(int last)
        void SetSolvent() 
        void SetNoSolvent() 
        inline int Begin_Atom() const 
        inline int End_Atom() const 
        inline bint IsSolvent() const 
        inline int Num_Atoms() const 
