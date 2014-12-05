# distutils: language = c++
from libcpp.vector cimport vector
from ParameterTypes cimport ptype
from Atom cimport Atom, _Atom
from Frame cimport Frame, _Frame

cdef inline vector[_Atom] atomlist_to_vector(list atlist):
    cdef Atom at
    cdef vector[_Atom] v
    for at in atlist:
        v.push_back(at.thisptr[0])
    return v
