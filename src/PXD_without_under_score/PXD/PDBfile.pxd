# distutils: language = c++
from libcpp.string cimport string
from CpptrajFile cimport *
from Atom cimport *


cdef extern from "PDBfile.h": 
    # PDBfile.h
    ctypedef enum PDB_RECTYPE "PDBfile::PDB_RECTYPE":
        ATOM "PDBfile::ATOM"
        HETATM "PDBfile::HETATM"
        TER "PDBfile::TER"
        ANISOU "PDBfile::ANISOU"
    cdef cppclass PDBfile "PDBfile":
        PDBfile() : anum_(1)
        bint IsPDBkeyword(const string&)
        bint ID_PDB(CpptrajFile&)
        bint IsPDBatomKeyword() 
        bint IsPDB_TER() 
        bint IsPDB_END() 
        Atom pdb_Atom(bint)
        Atom pdb_Atom() 
        NameType pdb_Residue(int&)
        void pdb_XYZ(double *)
        void WriteTER(int, const NameType&, char, int)
        void WriteHET(int, double, double, double)
        void WriteATOM(int, double, double, double, const char *, double)
        void WriteATOM(const char *, int, double, double, double, const char *, double)
        void WriteCoord(PDB_RECTYPE, int, const NameType&, const NameType&, char, int, double, double, double)
        void WriteCoord(PDB_RECTYPE, int, const NameType&, const NameType&, char, int, double, double, double, float, float, const char *, int, bint)
        void WriteANISOU(int, const NameType&, const NameType&, char, int, int, int, int, int, int, int, const char *, int)
        void WriteTITLE(const string&)
