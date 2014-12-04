# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Action cimport *


cdef extern from "Action_ClusterDihedral.h": 
    cdef cppclass Action_ClusterDihedral::DCnode "Action_ClusterDihedral::DCnode":
        DCnode() : count_(0)
        DCnode(vector[int]& binIn, int frameIn): BinIDs_(binIn ), frames_(1, frameIn ), count_(1)
        DCnode(const DCnode& rhs): BinIDs_(rhs BinIDs_ ), frames_(rhs frames_ ), count_(rhs count_)
        #DCnode& operator =(const DCnode& rhs)
        void Increment() 
        void AddFrame(int fIn)
        bint operator[( const DCnode& rhs) const 
        bint operator](const DCnode& rhs) const 
        #bint operator = =(const DCnode& rhs) const 
        bint BinMatch(vector[int]& binIn)
        long int Count() 
        bin_it binbegin() 
        bin_it binend() 
        frame_it framebegin() 
        frame_it frameend() 
        int NumFrames() 
    cdef cppclass Action_ClusterDihedral "Action_ClusterDihedral":
        Action_ClusterDihedral() 
        DispatchObject * Alloc() 
        void Help() 
    cdef cppclass Action_ClusterDihedral::DCmask "Action_ClusterDihedral::DCmask":
        DCmask() : a1_(0 ), a2_(0 ), a3_(0 ), a4_(0 ), bins_(0)
        DCmask(int a1, int a2, int a3, int a4, int bins, double min): a1_(a1 ), a2_(a2 ), a3_(a3 ), a4_(a4 ), bins_(bins ), step_(360 /(double)bins ), min_(min)
        int A1() 
        int A2() 
        int A3() 
        int A4() 
        int Bins() 
        double Step() 
        double Min() 
