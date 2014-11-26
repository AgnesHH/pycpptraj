# distutils: language = c++
from Atom cimport *
from Residue cimport *
from Molecule cimport *
from ParameterTypes cimport *
from AtomMask cimport *
from Frame cimport *
from FileName cimport *


cdef extern from "Topology.h": 
    cdef cppclass _Topology "Topology":
        _Topology() 
        void SetOffset(double oIn)
        void SetDebug(int dIn)
        void SetIpol(int iIn)
        void SetPindex(int pIn)
        void Increase_Frames(int fIn)
        void SetTag(const string& t)
        void SetVelInfo(bint v)
        void SetNrepDim(int n)
        void SetGBradiiSet(const string& s)
        void SetParmName(const string&, const _FileName&)
        void SetReferenceCoords(const _Frame&)
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
        const _FileName& OriginalFilename() const 
        const string& GBradiiSet() const 
        bint NoRefCoords() const 
        int FinalSoluteRes() const 
        const char * c_str() const 
        #atom_iterator begin() const 
        #atom_iterator end() const 
        const _Atom& operator[](int idx) const 
        const vector[_Atom]& _Atoms() const 
        #inline res_iterator ResStart() const 
        #inline res_iterator ResEnd() const 
        const _Residue& Res(int idx) const 
        _Residue& SetRes(int idx)
        #inline mol_iterator MolStart() const 
        #inline mol_iterator MolEnd() const 
        const _Molecule& Mol(int idx) const 
        void Clear_MoleculeInfo() 
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
        const _NonbondParmType& Nonbond() const 
        int SetNonbondInfo(const _NonbondParmType&)
        inline const _NonbondType& GetLJparam(int, int) const 
        const _CapParmType& Cap() const 
        void SetCap(const _CapParmType& c)
        const _LES_ParmType& LES() const 
        void SetLES(const _LES_ParmType& l)
        const _ChamberParmType& Chamber() const 
        void SetChamber(const _ChamberParmType& c)
        inline const vector[double]& Solty() const 
        inline const vector[_NameType]& Itree() const 
        inline const vector[int]& Join() const 
        inline const vector[int]& Irotat() const 
        string TruncRes_AtomName(int) const 
        string _AtomMaskName(int atom) const 
        string TruncResNameNum(int) const 
        int Find_AtomIn_Residue(int, const _NameType&) const 
        int Find_ResidueMaxNatom() const 
        int Solute_Atoms() const 
        int SetSolvent(const string&)
        void Summary() const 
        void Brief(const char *) const 
        void Print_AtomInfo(const string&) const 
        void PrintBondInfo(const string&) const 
        void PrintAngleInfo(const string&) const 
        void PrintDihedralInfo(const string&) const 
        void Print_MoleculeInfo(const string&) const 
        void Print_ResidueInfo(const string&) const 
        int PrintChargeMassInfo(const string&, int) const 
        inline const _Box& Parm_Box() const 
        inline BoxType _BoxType() const 
        void Set_Box(const _Box& bIn)
        int AddTop_Atom(const _Atom&, int, const _NameType&, const double *)
        void StartNewMol() 
        int CommonSetup(bint)
        int SetAmberExtra(const vector[double]&, const vector[_NameType]&, const vector[int]&, const vector[int]&)
        bint SetupIntegerMask(_AtomMask&) const 
        bint SetupCharMask(_AtomMask&) const 
        bint SetupIntegerMask(_AtomMask&, const _Frame&) const 
        bint SetupCharMask(_AtomMask&, const _Frame&) const 
        void ScaleDihedralK(double)
        _Topology * partialModifyStateByMask(const _AtomMask& m) const 
        _Topology * modifyStateByMask(const _AtomMask& m) const 
        _Topology * ModifyByMap(const vector[int]& m) const 

cdef class Topology:
    cdef _Topology* thisptr
