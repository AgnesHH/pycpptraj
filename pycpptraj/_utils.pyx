from libcpp.vector cimport vector
from cython.operator cimport dereference as deref, preincrement as incr
# convert cpptraj vector to python list and Python list to cpptraj vector

# use fused type
from ParameterTypes cimport ptype
from ParameterTypes cimport BondParmType, BondType
from ParameterTypes cimport _BondParmType, _BondType
from ParameterTypeVec cimport ParameterTypeVec

# TODO: make this work
#def vector_to_list(vector[ptype] v):
#    cdef vector[ptype].iterator it
#    cdef ParameterTypeVec ins
#    cdef list listout
#
#    it = v.begin()
#    listout = []
#    while it != v.end():
#        ins = ParameterTypeVec()
#        ins.thisptr[0] = deref(it)
#        listout.append(ins)
#        incr(it)
#    return listout


cdef vector[ptype] list_to_vector(listin, dtype):
    cdef vector[_BondParmType] v_BondParmType = vector[_BondParmType]()
    cdef vector[_BondType] v_BondType
    cdef ParameterTypeVec ins 

    for ins in listin:
        if dtype == "BondParmType":
            # explicit let Cython know type of ins
            v_BondParmType.push_back(ins.bondparmtype.thisptr[0])
        if dtype == "BondType":
            v_BondType.push_back(ins.bondtype.thisptr[0])
    # TODO: correct return 
    return v_BondParmType
#
