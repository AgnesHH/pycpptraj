# distutils: language = c++

from libc.stdlib cimport malloc 

cdef extern from "main.cpp": 
    int main(int argc, char **argv)

def  pycpptraj(args):
     #modified from Dag Sverre's comment in google group 
     #https://groups.google.com/forum/#!topic/cython-users/ldtOV1QwITA
     cdef char **c_argv
     args = [str(x) for x in args]
     c_argv = <char**>malloc(sizeof(char*) * len(args)) 
     for idx, s in enumerate(args):
         c_argv[idx] = s
     main(len(args), c_argv)
