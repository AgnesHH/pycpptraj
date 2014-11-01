# distutils: language = c++
from libcpp.string cimport string
from libcpp.vector cimport vector

cdef extern from "Analysis_Clustering.h":
    cdef cppclass _Analysis_Clustering "Analysis_Clustering":
        Analysis_Clustering()
        void Help()

        #test private method/attributes
        string maskexpr_
        int sieve_
        string clusterfile_
        bint nofitrms_
        bint useMass_

#cdef extern from "Analysis_Clustering.h" namespace "Analysis_Clustering":
#    string maskexpr_
