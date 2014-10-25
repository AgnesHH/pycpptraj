# distutil: language = c++

from libcpp.string cimport string
from CpptrajFile cimport *
from Atom cimport * 

cdef extern from "PDBfile.h":
    cdef cppclass PDBfile:
        PDBfile()
        #enum PDB_RECTYPE: ATOM=0, HETATM, TER, ANISOU
        bint IsPDBkeyword(string)
        bint ID_PDB(CpptrajFile&)
        bint IsPDBkeyword()
        bint IsPDB_TER()
        bint IsPDB_END()
        Atom pdb_Atom(bint)
        Atom pdb_Atom()
        NameType pdb_Residue(int&)
        void pdb_XYZ(double*)

        void WriteTER(int, NameType&, char, int)
        void WriteHET(int, double, double, double)
        void WriteATOM(int, double, double, double, char*, double)
        void WriteATOM(char*, int, double, double, double, char*, double)
        void WriteCoord(PDB_RECTYPE, int, NameTyp, NameTyp, char, int,
                        double, double, double)
        void WriteCoord(PDB_RECTYPE, int, NameTyp, NameTyp, char, int,
                         double, double, double, float, float, char*, int, bint)
        void WriteANISOU(int, NameType&, NameType&, char, int,
                        int, int, int, int, int, int, char*, int)
        void WriteTITLE(string&)
