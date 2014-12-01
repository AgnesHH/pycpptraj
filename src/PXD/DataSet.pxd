# distutils: language = c++
from Dimension cimport *
from libcpp.string cimport string


cdef extern from "DataSet.h": 
    # DataSet.h
    ctypedef enum DataType "DataSet::DataType":
        UNKNOWN_DATA "DataSet::UNKNOWN_DATA"
        DOUBLE "DataSet::DOUBLE"
        FLOAT "DataSet::FLOAT"
        INTEGER "DataSet::INTEGER"
        STRING "DataSet::STRING"
        MATRIX_DBL "DataSet::MATRIX_DBL"
        MATRIX_FLT "DataSet::MATRIX_FLT"
        COORDS "DataSet::COORDS"
        VECTOR "DataSet::VECTOR"
        MODES "DataSet::MODES"
        GRID_FLT "DataSet::GRID_FLT"
        REMLOG "DataSet::REMLOG"
        XYMESH "DataSet::XYMESH"
        TRAJ "DataSet::TRAJ"
    # DataSet.h
    ctypedef enum scalarMode "DataSet::scalarMode":
        M_DISTANCE "DataSet::M_DISTANCE"
        M_ANGLE "DataSet::M_ANGLE"
        M_TORSION "DataSet::M_TORSION"
        M_PUCKER "DataSet::M_PUCKER"
        M_RMS "DataSet::M_RMS"
        UNKNOWN_MODE "DataSet::UNKNOWN_MODE"
    # DataSet.h
    ctypedef enum scalarType "DataSet::scalarType":
        ALPHA "DataSet::ALPHA"
        BETA "DataSet::BETA"
        GAMMA "DataSet::GAMMA"
        DELTA "DataSet::DELTA"
        EPSILON "DataSet::EPSILON"
        ZETA "DataSet::ZETA"
        PUCKER "DataSet::PUCKER"
        CHI "DataSet::CHI"
        H1P "DataSet::H1P"
        C2P "DataSet::C2P"
        PHI "DataSet::PHI"
        PSI "DataSet::PSI"
        PCHI "DataSet::PCHI"
        OMEGA "DataSet::OMEGA"
        NOE "DataSet::NOE"
        UNDEFINED "DataSet::UNDEFINED"
    cdef cppclass _DataSet "DataSet":
        _DataSet() 
        _DataSet(DataType, int, int, int)
        _DataSet(const _DataSet&)
        #_DataSet& operator =(const _DataSet&)
        void SetWidth(int)
        void SetPrecision(int, int)
        int SetupSet(const string&, int, const string&)
        void SetLegend(const string& lIn)
        void SetScalar(scalarMode mIn)
        void SetDim(DimIdxType i, const _Dimension& d)
        inline void SetScalar(scalarMode, scalarType)
        int SetDataSetFormat(bint)
        bint Matches(const string&, int, const string&) const 
        void ScalarDescription() const 
        bint Empty() const 
        const string& Legend() const 
        const string& Name() const 
        int Idx() const 
        const string& Aspect() const 
        int ColumnWidth() const 
        DataType Type() const 
        scalarMode ScalarMode() const 
        scalarType ScalarType() const 
        size_t Ndim() const 
        _Dimension& Dim(DimIdxType i)
        _Dimension& Dim(int i)
        const _Dimension& Dim(int i) const 
        inline bint operator<(const _DataSet&) const 
        const char * DataFormat() const 
        scalarMode ModeFromKeyword(const string&)
        scalarType TypeFromKeyword(const string&, scalarMode&)
        scalarType TypeFromKeyword(const string&, const scalarMode&)


cdef class DataSet:
    cdef _DataSet* thisptr
