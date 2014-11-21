# distutils: language = c++
from libcpp.vector cimport vector
from libcpp.string cimport string
from Trajout cimport *
from TopologyList cimport *


cdef extern from "TrajoutList.h": 
    cdef cppclass TrajoutList "TrajoutList":
        TrajoutList() 
        #~TrajoutList() 
        void Clear() 
        void SetDebug(int)
        int AddEnsembleTrajout(const ArgList&, const TopologyList&, int)
        int AddTrajout(const ArgList&, const TopologyList&)
        int WriteTrajout(int, Topology *, Frame *)
        void CloseTrajout() 
        void List() const 
        bint Empty() const 
        ArgIt argbegin() const 
        ArgIt argend() const 
