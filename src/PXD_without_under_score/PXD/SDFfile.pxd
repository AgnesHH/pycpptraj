# distutils: language = c++
from libcpp.string cimport string
from CpptrajFile cimport *
from Atom cimport *


cdef extern from "SDFfile.h": 
    cdef cppclass SDFfile "SDFfile":
        SDFfile() 
        bint ID_SDF(CpptrajFile&)
        bint ReadHeader() 
        int SDF_XYZ(double *)
        Atom SDF_Atom() 
        int SDF_Bond(int&, int&)
        int SDF_Natoms() const 
        int SDF_Nbonds() const 
        const string& SDF_Title() const 
