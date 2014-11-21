# distutils: language = c++
from libcpp.string cimport string
from Trajin_Single cimport *
from ReferenceFrame cimport *


cdef extern from "ReferenceAction.h": 
    cdef cppclass ReferenceAction "ReferenceAction":
        ReferenceAction() 
        inline void SetRefStructure(const Frame&, bint, bint)
        int InitRef(bint, bint, bint, bint, const string&, ReferenceFrame&, Topology *, const string&, ArgList&, const char *)
        int SetupRef(const Topology&, int, const char *)
        inline void ActionRef(const Frame&, bint, bint)
        bint Previous() const 
        const char * RefModeString() const 
        const Frame& RefFrame() const 
        const Frame& SelectedRef() const 
        const Vec3& RefTrans() const 
