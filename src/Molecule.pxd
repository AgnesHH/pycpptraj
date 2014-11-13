# distutils: language = c++


cdef extern from "Molecule.h": 
    cdef cppclass _Molecule "Molecule":
        _Molecule()
        _Molecule(int begin, int end)
        void SetFirst(int begin)
        void SetLast(int last)
        void SetSolvent() 
        void SetNoSolvent() 
        inline int Begin_Atom() const 
        inline int End_Atom() const 
        inline bint IsSolvent() const 
        inline int Num_Atoms() const 
