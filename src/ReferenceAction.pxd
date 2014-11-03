# distutil: language = c++

cdef extern from "ReferenceAction.h":
    cdef cppclass _ReferenceAction "ReferenceAction":
        _ReferenceAction()
        inline void SetRefStructure(const _Frame&, bint, bint)
        int Initialize(bint, bint, bint, bint, const string&, _ArgList&, const char*)


