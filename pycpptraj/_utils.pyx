from libcpp.vector cimport vector
from cython.operator cimport dereference as deref, preincrement as incr
# convert cpptraj vector to python list and Python list to cpptraj vector

# use fused type
from ParameterTypes cimport ptype
from ParameterTypes cimport BondParmType, BondType
from ParameterTypes cimport _BondParmType, _BondType
from ParameterTypeVec cimport ParameterTypeVec

# TODO: make this work
cdef vector_to_list(vector[ptype] v):
    cdef vector[ptype].iterator it
    cdef list listout
    cdef BondParmType ins_bpt
    cdef BondType ins_bt

    it = v.begin()
    listout = []
    ins = None
    while it != v.end():
        if ptype == _BondParmType:
            ins_bpt = BondParmType()
            ins_bpt.thisptr[0] = deref(it)
            listout.append(ins_bpt)
        elif ptype == _BondType:
            ins_bt = BondType()
            ins_bt.thisptr[0] = deref(it)
            listout.append(ins_bt)
        incr(it)
    return listout


#cdef vector[ptype] list_to_vector(listin, dtype):
#    cdef vector[_BondParmType] v_BondParmType = vector[_BondParmType]()
#    cdef vector[_BondType] v_BondType
#    cdef ParameterTypeVec ins 
#
#    for ins in listin:
#        if dtype == "BondParmType":
#            # explicit let Cython know type of ins
#            v_BondParmType.push_back(ins.bondparmtype.thisptr[0])
#        if dtype == "BondType":
#            v_BondType.push_back(ins.bondtype.thisptr[0])
#    # TODO: correct return 
#    return v_BondParmType
#
