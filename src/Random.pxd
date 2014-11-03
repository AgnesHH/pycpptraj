# distutil: language = c++

cdef extern from "Random_Number.h":
    cdef cppclass Random_Number:
        Random_Number()
        void rn_set(int)
        void rn_set()
        double rn_gen()
        double rn_gauss(double, double)
        bint IsSet()
