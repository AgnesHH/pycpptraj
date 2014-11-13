# distutil: language = c++
from libcpp.string cimport string
from NameType cimport *

cdef extern from "MaskToken.h":
    ctypedef enum MaskTokenType "MaskToken::MaskTokenType":
        OP_NONE "MaskToken::OP_NONE"
        ResNum "MaskToken::ResNum"
        ResName "MaskToken::ResName"
        AtomNum "MaskToken::AtomNum"
        AtomName "MaskToken::AtomName"
        AtomType "MaskToken::AtomType"
        AtomElement "MaskToken::AtomElement"
        SelectAll "MaskToken::SelectAll"
        OP_AND "MaskToken::OP_AND"
        OP_OR "MaskToken::OP_OR"
        OP_NEG "MaskToken::OP_NEG"
        OP_DIST "MaskToken::OP_DIST"

    cdef cppclass _MaskToken "MaskToken":
        _MaskToken()
        const char* TypeName()
        void Print()
        int SetToken(MaskTokenType, const string&)
        int SetDistance(string&)
        void SetOperator(MaskTokenType)

        inline MaskTokenType Type()
        inline int Res1()
        inline int Res2()
        inline const _NameType& Name()
        inline bint OnStack()
        inline bint Within()
        inline bint ByAtom()
        inline double Distance()

        void SetOnStack()

