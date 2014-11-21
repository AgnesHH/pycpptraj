# distutils: language = c++

from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "ParameterTypes.h": 
    ctypedef vector[BondParmType] BondParmArray
    ctypedef vector[BondType] BondArray
    ctypedef vector[AngleParmType] AngleParmArray
    ctypedef vector[AngleType] AngleArray
    ctypedef vector[DihedralParmType] DihedralParmArray
    ctypedef vector[DihedralType] DihedralArray
    ctypedef vector[HB_ParmType] HB_ParmArray
    ctypedef vector[NonbondType] NonbondArray
    ctypedef vector[LES_AtomType] LES_Array
    ctypedef vector[CmapGridType] CmapGridArray
    ctypedef vector[CmapType] CmapArray
    cdef cppclass AngleType "AngleType":
        AngleType() 
        AngleType(int a1, int a2, int a3, int idx)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int Idx() const 
    cdef cppclass NonbondParmType "NonbondParmType":
        NonbondParmType() 
        NonbondParmType(int n, const vector[int]& nbi, const NonbondArray& nba, const HB_ParmArray& hba)
        inline bint HasNonbond() const 
        inline int Ntypes() const 
        const vector[int]& NBindex() const 
        const NonbondArray& NBarray() const 
        const HB_ParmArray& HBarray() const 
        const NonbondType& NBarray(int i) const 
        const HB_ParmType& HBarray(int i) const 
        int GetLJindex(int type1, int type2) const 
    cdef cppclass LES_AtomType "LES_AtomType":
        LES_AtomType() 
        LES_AtomType(int t, int c, int i)
        inline int Type() const 
        inline int Copy() const 
        inline int ID() const 
    cdef cppclass AngleParmType "AngleParmType":
        AngleParmType() 
        AngleParmType(double tk, double teq)
        inline double Tk() const 
        inline double Teq() const 
    cdef cppclass CmapType "CmapType":
        CmapType() 
        CmapType(int a1, int a2, int a3, int a4, int a5, int i)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int A4() const 
        inline int A5() const 
        inline int Idx() const 
    cdef cppclass LES_ParmType "LES_ParmType":
        LES_ParmType() 
        LES_ParmType(int na, int nt, const vector[double]& fac)
        inline bint HasLES() const 
        inline int Ntypes() const 
        inline int Ncopies() const 
        const vector[double]& FAC() const 
        const LES_Array& Array() const 
        void SetTypes(int n, const vector[double]& f)
        void AddLES_Atom(const LES_AtomType& lat)
    cdef cppclass HB_ParmType "HB_ParmType":
        HB_ParmType() 
        HB_ParmType(double a, double b, double c)
        inline double Asol() const 
        inline double Bsol() const 
        inline double HBcut() const 
    cdef cppclass NonbondType "NonbondType":
        NonbondType() 
        NonbondType(double a, double b)
        inline double A() const 
        inline double B() const 
    cdef cppclass ChamberParmType "ChamberParmType":
        ChamberParmType() 
        bint HasChamber() const 
        bint HasCmap() const 
        int FF_Version() const 
        const string& FF_Type() const 
        const BondArray& UB() const 
        const BondParmArray& UBparm() const 
        const DihedralArray& Impropers() const 
        const DihedralParmArray& ImproperParm() const 
        const NonbondArray& LJ14() const 
        const CmapGridArray& CmapGrid() const 
        const CmapArray& Cmap() const 
        void SetLJ14(const NonbondArray& nb)
        void SetChamber(int i, const string& s)
        void SetUB(const BondArray& ub, const BondParmArray& ubp)
        void SetImproper(const DihedralArray& im, const DihedralParmArray& imp)
        void AddCmapGrid(const CmapGridType& g)
        void AddCmapTerm(const CmapType& c)
    cdef cppclass BondParmType "BondParmType":
        BondParmType() 
        BondParmType(double rk, double req)
        inline double Rk() const 
        inline double Req() const 
    cdef cppclass CmapGridType "CmapGridType":
        CmapGridType() 
        CmapGridType(int r, const vector[double]& g)
        inline int Resolution() const 
        inline const vector[double]& Grid() const 
    # ParameterTypes.h
    ctypedef enum Dtype "DihedralType::Dtype":
        NORMAL "DihedralType::NORMAL"
        IMPROPER "DihedralType::IMPROPER"
        END "DihedralType::END"
        BOTH "DihedralType::BOTH"
    cdef cppclass DihedralType "DihedralType":
        DihedralType() 
        DihedralType(int a1, int a2, int a3, int a4, int idx)
        DihedralType(int a1, int a2, int a3, int a4, Dtype t, int i)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int A4() const 
        inline Dtype Type() const 
        inline int Idx() const 
    cdef cppclass BondType "BondType":
        BondType() 
        BondType(int a1, int a2, int idx)
        inline int A1() const 
        inline int A2() const 
        inline int Idx() const 
        void SetIdx(int i)
    cdef cppclass CapParmType "CapParmType":
        CapParmType() 
        CapParmType(int n, double c, double x, double y, double z)
        inline bint HasWaterCap() const 
        inline int NatCap() const 
        inline double CutCap() const 
        inline double xCap() const 
        inline double yCap() const 
        inline double zCap() const 
    cdef cppclass DihedralParmType "DihedralParmType":
        DihedralParmType() 
        DihedralParmType(double k, double n, double p, double e, double b)
        DihedralParmType(double k, double p)
        inline double Pk() const 
        inline double& Pk() 
        inline double Pn() const 
        inline double Phase() const 
        inline double SCEE() const 
        inline double SCNB() const 
        void SetSCEE(double s)
        void SetSCNB(double s)
