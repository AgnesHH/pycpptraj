# distutil: language = c++

cdef extern from "MaskToken.h":
    ctypedef enum MaskTokenType "MaskToken::MaskTokenType"
    cdef cppclass _MaskToken "MaskToken":
        _MaskToken()
        const char* TypeName()
        void Print()
        int SetToken(MaskTokenType, const static&)
        int SetDistance(string&)
        void SetOperator(MaskTokenType)

        inline MaskTokenType Type()
        inline int Res1()
        inline int Res2()
        inline const NameType& Name()
        inline bint OnStack()
        inline bint Within()
        inline bint ByAtom()
        inline double Distance()

        void SetOnStack()

