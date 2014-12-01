# distutils: language = c++
from CpptrajFile cimport *
from Atom cimport *


cdef extern from "PDBfile.h": 
    # PDBfile.h
    ctypedef enum PDB_RECTYPE "PDBfile::PDB_RECTYPE":
        ATOM "PDBfile::ATOM"
        HETATM "PDBfile::HETATM"
        TER "PDBfile::TER"
        ANISOU "PDBfile::ANISOU"
    cdef cppclass _PDBfile "PDBfile":
        _PDBfile() : anum_(1)
        bint IsPDBkeyword(const string&)
        bint ID_PDB(_CpptrajFile&)
        bint IsPDBatomKeyword() 
        bint IsPDB_TER() 
        bint IsPDB_END() 
        _Atom pdb_Atom(bint)
        _Atom pdb_Atom() 
        _NameType pdb_Residue(int&)
        void pdb_XYZ(double *)
        void WriteTER(int, const _NameType&, char, int)
        void WriteHET(int, double, double, double)
        void WriteATOM(int, double, double, double, const char *, double)
        void WriteATOM(const char *, int, double, double, double, const char *, double)
        void WriteCoord(PDB_RECTYPE, int, const _NameType&, const _NameType&, char, int, double, double, double)
        void WriteCoord(PDB_RECTYPE, int, const _NameType&, const _NameType&, char, int, double, double, double, float, float, const char *, int, bint)
        void WriteANISOU(int, const _NameType&, const _NameType&, char, int, int, int, int, int, int, int, const char *, int)
        void WriteTITLE(const string&)
