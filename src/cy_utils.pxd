# distutils: language = c+=

from ParameterTypes cimport *

cdef inline convert_objlist_to_vector(fused_pyclass, in_list, fused_v_for_ParameterTypes):
    cdef fused_pyclass ins              
    cdef fused_v_for_ParameterTypes v                 
    for ins in in_list:           
        v.push_back(ins.thisptr[0])
    return v

