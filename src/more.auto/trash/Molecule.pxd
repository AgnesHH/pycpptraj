# distutils: language = c++


cdef extern from "Molecule.h": 
    cdef cpplass _Molecule "Molecule":
        _Molecule() 
        _Molecule(int , int )
        #void SetFirst(int )
        #void SetLast(int )
        #void SetSolvent() 
        #void SetNoSolvent() 
        #int Begin_Atom() const 
        #int End_Atom() const 
        #bint IsSolvent() const 
        #int Num_Atoms() const 
