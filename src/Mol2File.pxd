# distutil: language = c++

from libcpp.string cimport string
from NameType cimport NameType
from CpptrajFile cimport CpptrajFile
from Atom cimport Atom

cdef extern from "Mol2File.h":
    enum TRIPOSTAG: MOLECULE=0, ATOM, BOND, SUBSTRUCT
    cdef cppclass Mol2File:
        Mol2File()

        bint IsMol2Keyword(const char*)
        bint ID_Mol2(CpptrajFile&)
        int ScanTo(TRIPOSTAG)
        void WriteHeader(TRIPOSTAG)
        bint ReadMolecule()
        bint WriteMolecule(bint, int)
        int NextMolecule()
        int Mol2Bond(int&, int&)
        int Mol2XYZ(double*)
        Atom Mol2Atom()
        NameType Mol2Residue(int&)

        void SetMol2Natoms(int nIn)
        void SetMol2Nbonds(int nIn)
        void SetMol2Title(string& tIn)
        int Mol2Natoms()
        int Mol2Nbonds()
        string Mol2Title()
