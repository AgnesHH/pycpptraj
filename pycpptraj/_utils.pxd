# distutils: language = c++
from libc.stdlib cimport malloc 
from libcpp.vector cimport vector

cdef inline int get_positive_idx(idx, size):
    # TODO : do we need this method?
    # we can we memoryview to get slicing too
    """Used for negative indexing"""
    if idx < 0:
        idx = size + idx
        if idx < 0:
            raise ValueError("index is out of range")
    if idx >= size:
        raise ValueError("index is out of range")
    return idx

cdef inline char** list_to_char_pp(args):
     cdef char** c_argv
     args = [str(x) for x in args]
     c_argv = <char**>malloc(sizeof(char*) * len(args)) 
     for idx, s in enumerate(args):
         c_argv[idx] = s
     return c_argv

