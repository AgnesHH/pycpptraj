# distutils: language = c++

from libc.stdlib cimport malloc 

cdef inline char **wrap_argv(args):
     cdef char **c_argv
     args = [str(x) for x in args]
     c_argv = <char**>malloc(sizeof(char*) * len(args)) 
     for idx, s in enumerate(args):
         c_argv[idx] = s
     return c_argv
