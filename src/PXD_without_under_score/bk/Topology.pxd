# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Atom cimport *
from Residue cimport *
from Molecule cimport *
from ParameterTypes cimport *
from AtomMask cimport *
from Frame cimport *
from FileName cimport *


cdef extern from "Topology.h": 
    cdef cppclass Topology "Topology":
        Topology() 
        void SetOffset(double oIn)
        void SetDebug(int dIn)
        void SetIpol(int iIn)
        void SetPindex(int pIn)
        void IncreaseFrames(int fIn)
        void SetTag(const string& t)
        void SetVelInfo(bint v)
        void SetNrepDim(int n)
        void SetGBradiiSet(const string& s)
        void SetParmName(const string&, const FileName&)
        void SetReferenceCoords(const Frame&)
        const string& Tag() const 
        int Ipol() const 
        int Pindex() const 
        int Natom() const 
        int Nres() const 
        int Nmol() const 
        int Nsolvent() const 
        int Nframes() const 
        int NextraPts() const 
        bint HasVelInfo() const 
        int NrepDim() const 
        const string& ParmName() const 
        const FileName& OriginalFilename() const 
        const string& GBradiiSet() const 
        bint NoRefCoords() const 
        int FinalSoluteRes() const 
        const char * c_str() const 
        atom_iterator begin() const 
        atom_iterator end() const 
        const Atom& operator[](int idx) const 
        const vector[Atom]& Atoms() const 
        inline res_iterator ResStart() const 
        inline res_iterator ResEnd() const 
        const Residue& Res(int idx) const 
        Residue& SetRes(int idx)
        inline mol_iterator MolStart() const 
        inline mol_iterator MolEnd() const 
        const Molecule& Mol(int idx) const 
        void ClearMoleculeInfo() 
        const BondArray& Bonds() const 
        const BondArray& BondsH() const 
        const BondParmArray& BondParm() const 
        void AddBond(int, int)
        int SetBondInfo(const BondArray&, const BondArray&, const BondParmArray&)
        const AngleArray& Angles() const 
        const AngleArray& AnglesH() const 
        const AngleParmArray& AngleParm() const 
        int SetAngleInfo(const AngleArray&, const AngleArray&, const AngleParmArray&)
        const DihedralArray& Dihedrals() const 
        const DihedralArray& DihedralsH() const 
        const DihedralParmArray& DihedralParm() const 
        int SetDihedralInfo(const DihedralArray&, const DihedralArray&, const DihedralParmArray&)
        const NonbondParmType& Nonbond() const 
        int SetNonbondInfo(const NonbondParmType&)
        inline const NonbondType& GetLJparam(int, int) const 
        const CapParmType& Cap() const 
        void SetCap(const CapParmType& c)
        const LES_ParmType& LES() const 
        void SetLES(const LES_ParmType& l)
        const ChamberParmType& Chamber() const 
        void SetChamber(const ChamberParmType& c)
        inline const vector[double]& Solty() const 
        inline const vector[NameType]& Itree() const 
        inline const vector[int]& Join() const 
        inline const vector[int]& Irotat() const 
        string TruncResAtomName(int) const 
        string AtomMaskName(int atom) const 
        string TruncResNameNum(int) const 
        int FindAtomInResidue(int, const NameType&) const 
        int FindResidueMaxNatom() const 
        int SoluteAtoms() const 
        int SetSolvent(const string&)
        void Summary() const 
        void Brief(const char *) const 
        void PrintAtomInfo(const string&) const 
        void PrintBondInfo(const string&) const 
        void PrintAngleInfo(const string&) const 
        void PrintDihedralInfo(const string&) const 
        void PrintMoleculeInfo(const string&) const 
        void PrintResidueInfo(const string&) const 
        int PrintChargeMassInfo(const string&, int) const 
        inline const Box& ParmBox() const 
        inline BoxType BoxType() const 
        void SetBox(const Box& bIn)
        int AddTopAtom(const Atom&, int, const NameType&, const double *)
        void StartNewMol() 
        int CommonSetup(bint)
        int SetAmberExtra(const vector[double]&, const vector[NameType]&, const vector[int]&, const vector[int]&)
        bint SetupIntegerMask(AtomMask&) const 
        bint SetupCharMask(AtomMask&) const 
        bint SetupIntegerMask(AtomMask&, const Frame&) const 
        bint SetupCharMask(AtomMask&, const Frame&) const 
        void ScaleDihedralK(double)
        Topology * partialModifyStateByMask(const AtomMask& m) const 
        Topology * modifyStateByMask(const AtomMask& m) const 
        Topology * ModifyByMap(const vector[int]& m) const 
