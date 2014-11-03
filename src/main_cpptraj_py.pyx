# distutils: language = c++

from libc.stdlib cimport malloc 

cdef extern from "main.cpp": 
    int main(int argc, char **argv)

def  pycpptraj(args):
     cdef char **c_argv
     args = [str(x) for x in args]
     c_argv = <char**>malloc(sizeof(char*) * len(args)) 
     for idx, s in enumerate(args):
         c_argv[idx] = s
     main(len(args), c_argv)
