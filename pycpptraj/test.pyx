# distutils: language = c++
from util import convert_vec2list

TEXT ="""
cdef vector[_%s] %s_to_vector(list inputlist):
    cdef %s at
    cdef vector[_%s] v
    for at in inputlist:
        v.push_back(at.thisptr[0])
    return v"""

at = convert_vec2list("Atom", TEXT)
print help(at)
