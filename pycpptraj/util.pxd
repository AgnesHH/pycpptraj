# distutils: language = c++
from libcpp.vector cimport vector
from ParameterTypes cimport *
from Atom cimport Atom, _Atom
from Frame cimport Frame, _Frame

# Anyway to combine those methods into single one?
# metaprogramming?

classlist = ['BondParmArray', 'BondArray', 'AngleParmArray', 'AngleArray',
             'DihedralParmArray', 'DihedralArray', 'HB_ParmArray',
             'NonbondArray', 'LES_Array', 'CmapGridArray', 'CmapArray',
             'Atom']

#cdef class ConvertV2L(object):
#    def __init__(self):
#        for pyname in classlist:
#            func_name = pyname + "_to_vector"
#            setattr(self.__class__, func_name)

# vector[_Atom]
cdef inline vector[_Atom] atomlist_to_vector(list inputlist):
    cdef Atom at
    cdef vector[_Atom] v
    for at in inputlist:
        v.push_back(at.thisptr[0])
    return v

# vector[_BondParmType]
cdef inline vector[_BondParmType] bondparmtype_to_vector(list inputlist):
    cdef BondParmType at
    cdef vector[_BondParmType] v
    for at in inputlist:
        v.push_back(at.thisptr[0])
    return v

# How?
#TEXT ="""
#cdef inline vector[_%s] %s_to_vector(list inputlist):
#    cdef %s at
#    cdef vector[_%s] v
#    for at in inputlist:
#        v.push_back(at.thisptr[0])
#    return v"""
#
#cdef inline convert_vec2list(typename, TEXT):
#    return eval(TEXT) % (typename, typename, typename, typename)

