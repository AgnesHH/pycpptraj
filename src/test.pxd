# distutils: language = c++


cdef extern from "ParameterTypes.h": 
    cdef cppclass _AngleType "AngleType":
        _AngleType() : a1_(0 ), a2_(0 ), a3_(0 ), idx_(0)
        _AngleType(int a1, int a2, int a3, int idx): a1_(a1 ), a2_(a2 ), a3_(a3 ), idx_(idx)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int Idx() const 


    cdef cppclass _NonbondParmType "NonbondParmType":
        _NonbondParmType() : ntypes_(0)
        _NonbondParmType(int n, const vector[int]& nbi, const NonbondArray& nba, const HB_ParmArray& hba): ntypes_(n ), nbindex_(nbi ), nbarray_(nba ), hbarray_(hba)
        inline bint HasNonbond() const 
        inline int Ntypes() const 
        const vector[int]& NBindex() const 
        const NonbondArray& NBarray() const 
        const HB_ParmArray& HBarray() const 
        const _NonbondType& NBarray(int i) const 
        const _HB_ParmType& HBarray(int i) const 
        int GetLJindex(int type1, int type2) const 


    cdef cppclass _LES_AtomType "LES_AtomType":
        _LES_AtomType() : type_(0 ), cnum_(0 ), id_(0)
        _LES_AtomType(int t, int c, int i): type_(t ), cnum_(c ), id_(i)
        inline int Type() const 
        inline int Copy() const 
        inline int ID() const 


    cdef cppclass _AngleParmType "AngleParmType":
        _AngleParmType() : tk_(0 ), teq_(0)
        _AngleParmType(double tk, double teq): tk_(tk ), teq_(teq)
        inline double Tk() const 
        inline double Teq() const 


    cdef cppclass _CmapType "CmapType":
        _CmapType() : a1_(0 ), a2_(0 ), a3_(0 ), a4_(0 ), a5_(0 ), idx_(0)
        _CmapType(int a1, int a2, int a3, int a4, int a5, int i): a1_(a1 ), a2_(a2 ), a3_(a3 ), a4_(a4 ), a5_(a5 ), idx_(i)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int A4() const 
        inline int A5() const 
        inline int Idx() const 


    cdef cppclass _LES_ParmType "LES_ParmType":
        _LES_ParmType() : ntypes_(0 ), ncopies_(0)
        _LES_ParmType(int na, int nt, const vector[double]& fac): ntypes_(nt ), ncopies_(0 ), fac_(fac)
        inline bint HasLES() const 
        inline int Ntypes() const 
        inline int Ncopies() const 
        const vector[double]& FAC() const 
        const LES_Array& Array() const 
        void SetTypes(int n, const vector[double]& f)
        void AddLES_Atom(const _LES_AtomType& lat)


    cdef cppclass _HB_ParmType "HB_ParmType":
        _HB_ParmType() : asol_(0 ), bsol_(0 ), hbcut_(0)
        _HB_ParmType(double a, double b, double c): asol_(a ), bsol_(b ), hbcut_(c)
        inline double Asol() const 
        inline double Bsol() const 
        inline double HBcut() const 


    cdef cppclass _NonbondType "NonbondType":
        _NonbondType() : A_(0 ), B_(0)
        _NonbondType(double a, double b): A_(a ), B_(b)
        inline double A() const 
        inline double B() const 


    cdef cppclass _ChamberParmType "ChamberParmType":
        _ChamberParmType() : chmff_verno_(- 1)
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
        void AddCmapGrid(const _CmapGridType& g)
        void AddCmapTerm(const _CmapType& c)


    cdef cppclass _BondParmType "BondParmType":
        _BondParmType() : rk_(0 ), req_(0)
        _BondParmType(double rk, double req): rk_(rk ), req_(req)
        inline double Rk() const 
        inline double Req() const 


    cdef cppclass _CmapGridType "CmapGridType":
        _CmapGridType() : resolution_(0)
        _CmapGridType(int r, const vector[double]& g): resolution_(r ), grid_(g)
        inline int Resolution() const 
        inline const vector[double]& Grid() const 


    # ParameterTypes.h
    ctypedef enum Dtype "DihedralType::Dtype":
        NORMAL "DihedralType::NORMAL"
        IMPROPER "DihedralType::IMPROPER"
        END "DihedralType::END"
        BOTH "DihedralType::BOTH"
    cdef cppclass _DihedralType "DihedralType":
        _DihedralType() : a1_(0 ), a2_(0 ), a3_(0 ), a4_(0 ), type_(NORMAL ), idx_(0)
        _DihedralType(int a1, int a2, int a3, int a4, int idx): a1_(a1 ), a2_(a2 ), a3_(a3 ), a4_(a4 ), idx_(idx)
        _DihedralType(int a1, int a2, int a3, int a4, Dtype t, int i): a1_(a1 ), a2_(a2 ), a3_(a3 ), a4_(a4 ), type_(t ), idx_(i)
        inline int A1() const 
        inline int A2() const 
        inline int A3() const 
        inline int A4() const 
        inline Dtype Type() const 
        inline int Idx() const 


    cdef cppclass _BondType "BondType":
        _BondType() : a1_(0 ), a2_(0 ), idx_(0)
        _BondType(int a1, int a2, int idx): a1_(a1 ), a2_(a2 ), idx_(idx)
        inline int A1() const 
        inline int A2() const 
        inline int Idx() const 
        void SetIdx(int i)


    cdef cppclass _CapParmType "CapParmType":
        _CapParmType() : natcap_(0 ), cutcap_(0 ), xcap_(0 ), ycap_(0 ), zcap_(0)
        _CapParmType(int n, double c, double x, double y, double z): natcap_(n ), cutcap_(c ), xcap_(x ), ycap_(y ), zcap_(z)
        inline bint HasWaterCap() const 
        inline int NatCap() const 
        inline double CutCap() const 
        inline double xCap() const 
        inline double yCap() const 
        inline double zCap() const 


    cdef cppclass _DihedralParmType "DihedralParmType":
        _DihedralParmType() : pk_(0 ), pn_(0 ), phase_(0 ), scee_(0 ), scnb_(0)
        _DihedralParmType(double k, double n, double p, double e, double b): pk_(k ), pn_(n ), phase_(p ), scee_(e ), scnb_(b)
        _DihedralParmType(double k, double p): pk_(k ), pn_(0 ), phase_(p ), scee_(0 ), scnb_(0)
        inline double Pk() const 
        inline double& Pk() 
        inline double Pn() const 
        inline double Phase() const 
        inline double SCEE() const 
        inline double SCNB() const 
        void SetSCEE(double s)
        void SetSCNB(double s)


cdef class AngleType:
    cdef _AngleType* thisptr
cdef class NonbondParmType:
    cdef _NonbondParmType* thisptr
cdef class LES_AtomType:
    cdef _LES_AtomType* thisptr
cdef class AngleParmType:
    cdef _AngleParmType* thisptr
cdef class CmapType:
    cdef _CmapType* thisptr
cdef class LES_ParmType:
    cdef _LES_ParmType* thisptr
cdef class HB_ParmType:
    cdef _HB_ParmType* thisptr
cdef class NonbondType:
    cdef _NonbondType* thisptr
cdef class ChamberParmType:
    cdef _ChamberParmType* thisptr
cdef class BondParmType:
    cdef _BondParmType* thisptr
cdef class CmapGridType:
    cdef _CmapGridType* thisptr
cdef class DihedralType:
    cdef _DihedralType* thisptr
cdef class BondType:
    cdef _BondType* thisptr
cdef class CapParmType:
    cdef _CapParmType* thisptr
cdef class DihedralParmType:
    cdef _DihedralParmType* thisptr
