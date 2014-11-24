# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *
from Random cimport *
from DataSet_Vector cimport *


cdef extern from "Action_Rotdif.h": 
    cdef cppclass Action_Rotdif "Action_Rotdif":
        Action_Rotdif() 
        DispatchObject * Alloc() 
        void Help() 
        #~Action_Rotdif() 
    cdef cppclass Action_Rotdif::Vec6 "Action_Rotdif::Vec6":
        Vec6() 
        void Q_to_D(Matrix_3x3&) const 
        void D_to_Q(const Matrix_3x3&)
        double& operator[](int idx)
        const double& operator[](int idx) const 
