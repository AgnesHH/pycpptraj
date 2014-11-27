# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.set cimport set
from NameType cimport *


cdef extern from "Atom.h": 
    ctypedef enum AtomicElementType "Atom::AtomicElementType":
        UNKNOWN_ELEMENT "Atom::UNKNOWN_ELEMENT"
        HYDROGEN "Atom::HYDROGEN"
        BORON "Atom::BORON"
        CARBON "Atom::CARBON"
        NITROGEN "Atom::NITROGEN"
        OXYGEN "Atom::OXYGEN"
        FLUORINE "Atom::FLUORINE"
        PHOSPHORUS "Atom::PHOSPHORUS"
        SULFUR "Atom::SULFUR"
        CHLORINE "Atom::CHLORINE"
        BROMINE "Atom::BROMINE"
        IRON "Atom::IRON"
        CALCIUM "Atom::CALCIUM"
        IODINE "Atom::IODINE"
        MAGNESIUM "Atom::MAGNESIUM"
        COPPER "Atom::COPPER"
        LITHIUM "Atom::LITHIUM"
        POTASSIUM "Atom::POTASSIUM"
        RUBIDIUM "Atom::RUBIDIUM"
        CESIUM "Atom::CESIUM"
        ZINC "Atom::ZINC"
        SODIUM "Atom::SODIUM"
        ALUMINUM "Atom::ALUMINUM"
        ARGON "Atom::ARGON"
        ARSENIC "Atom::ARSENIC"
        SILVER "Atom::SILVER"
        GOLD "Atom::GOLD"
        ASTATINE "Atom::ASTATINE"
        BERYLLIUM "Atom::BERYLLIUM"
        BARIUM "Atom::BARIUM"
        BISMUTH "Atom::BISMUTH"
        CHROMIUM "Atom::CHROMIUM"
        COBALT "Atom::COBALT"
        CADMIUM "Atom::CADMIUM"
        FRANCIUM "Atom::FRANCIUM"
        GALLIUM "Atom::GALLIUM"
        GERMANIUM "Atom::GERMANIUM"
        HELIUM "Atom::HELIUM"
        HAFNIUM "Atom::HAFNIUM"
        MERCURY "Atom::MERCURY"
        INDIUM "Atom::INDIUM"
        IRIDIUM "Atom::IRIDIUM"
        KRYPTON "Atom::KRYPTON"
        MANGANESE "Atom::MANGANESE"
        MOLYBDENUM "Atom::MOLYBDENUM"
        NEON "Atom::NEON"
        NICKEL "Atom::NICKEL"
        NIOBIUM "Atom::NIOBIUM"
        OSMIUM "Atom::OSMIUM"
        PALLADIUM "Atom::PALLADIUM"
        PLATINUM "Atom::PLATINUM"
        LEAD "Atom::LEAD"
        POLONIUM "Atom::POLONIUM"
        RUTHENIUM "Atom::RUTHENIUM"
        RHODIUM "Atom::RHODIUM"
        RHENIUM "Atom::RHENIUM"
        RADON "Atom::RADON"
        RADIUM "Atom::RADIUM"
        SILICON "Atom::SILICON"
        SCANDIUM "Atom::SCANDIUM"
        SELENIUM "Atom::SELENIUM"
        STRONTIUM "Atom::STRONTIUM"
        TIN "Atom::TIN"
        ANTIMONY "Atom::ANTIMONY"
        TITANIUM "Atom::TITANIUM"
        TECHNETIUM "Atom::TECHNETIUM"
        TELLURIUM "Atom::TELLURIUM"
        TANTALUM "Atom::TANTALUM"
        THALLIUM "Atom::THALLIUM"
        VANADIUM "Atom::VANADIUM"
        TUNGSTEN "Atom::TUNGSTEN"
        XENON "Atom::XENON"
        ZIRCONIUM "Atom::ZIRCONIUM"
        YTTRIUM "Atom::YTTRIUM"
        LUTETIUM "Atom::LUTETIUM"
        EXTRAPT "Atom::EXTRAPT"
    cdef cppclass _Atom "Atom":
        _Atom() 
        #virtual ~_Atom() 
        _Atom(const _NameType&, char, const char *)
        _Atom(const _NameType&, const _NameType&, double)
        _Atom(const _NameType&, double, double, const _NameType&)
        _Atom(const _NameType&, double, double, int, double, int, const _NameType&, double, double)
        _Atom(const _Atom&)
        void swap(_Atom&, _Atom&)
        #_Atom& operator =(_Atom)
        #inline bond_iterator bondbegin() const 
        #inline bond_iterator bondend() const 
        #inline excluded_iterator excludedbegin() const 
        #inline excluded_iterator excludedend() const 
        void SetResNum(int resnumIn)
        void SetMol(int molIn)
        void SetCharge(double qin)
        void SetGBradius(double rin)
        inline bint NoMol() const 
        inline const char * c_str() const 
        inline int ResNum() const 
        inline AtomicElementType Element() const 
        inline int AtomicNumber() const 
        inline const char * ElementName() const 
        inline const _NameType& Name() const 
        inline const _NameType& Type() const 
        inline int TypeIndex() const 
        inline int MolNum() const 
        inline char ChainID() const 
        inline int Nbonds() const 
        inline int Nexcluded() const 
        inline double Mass() const 
        inline double Charge() const 
        inline double Polar() const 
        inline double GBRadius() const 
        inline double Screen() const 
        void AddBond(int)
        void ClearBonds() 
        void SortBonds() 
        void AddExclusionList(const set[int]&)
        double GetBondLength(AtomicElementType, AtomicElementType)


cdef class Atom:
    cdef _Atom* thisptr
