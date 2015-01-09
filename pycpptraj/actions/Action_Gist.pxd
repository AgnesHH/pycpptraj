# distutils: language = c++
#from libcpp.vector cimport vector
#from libcpp.string cimport string
from pycpptraj.actions.Action cimport _Action, Action
#from Vec3 cimport *
#from Matrix_3x3 cimport *
#from ImagedAction cimport *
#from Timer cimport *


cdef extern from "Action_Gist.h": 
    cdef cppclass _Action_Gist "Action_Gist" (_Action):
        _Action_Gist() 
        _DispatchObject * Alloc() 
        void Help() 


cdef class Action_Gist (Action):
    cdef _Action_Gist* thisptr

