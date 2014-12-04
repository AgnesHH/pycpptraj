# distutils: language = c+=

from ParameterTypes cimport *

cdef inline V_ParameterTypes convert_objlist_to_vector(List_ParameterTypes, in_list, V_ParameterTypes):
    cdef List_ParameterTypes ins              
    cdef V_ParameterTypes v                 
    for ins in in_list:           
        v.push_back(ins.thisptr[0])
    return v

