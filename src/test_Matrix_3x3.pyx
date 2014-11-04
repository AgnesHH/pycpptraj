# distutils: language = c++
#@Dan and Jason: This file shows how I will wrap cpptraj lib
#this code is not correct (yet), just try to make a workflow. :D
#
from Vec3 cimport *
from Vec3_py cimport Vec3
from Vec3_py import Vec3 
from Matrix_3x3 cimport *

#cdef Vec3 wrap_Vec3_instance(_Vec3* p_instance):
#    cdef Vec3 ret = Vec3.__new__(Vec3)
#    ret.thisptr = p_instance
#    return ret

cdef class Matrix_3x3:
    cdef: 
        _Matrix_3x3 * thisptr

    def __cinit__(self):
        self.thisptr = new _Matrix_3x3()

    #def __cinit__(self, X=None):
    #    """TODO: add numpy array"""
    #    if X is None: 
    #        self.thisptr = new _Matrix_3x3()
    #    elif isinstance(X, (float, int)):
    #        if len(X) == 1:
    #            self.thisptr = new _Matrix_3x3(X)
    #        elif len(X) == 3:
    #            self.thisptr = new _Matrix_3x3(X[0], X[1], X[2])

    def __dealloc__(self):
        """Free memory"""
        del self.thisptr

    def Diagonalize_(self, Vec3 vect):
        
        self.thisptr.Diagonalize(vect.thisptr[0])
        
    cdef Diagonalize(self, _Vec3 vect):
        #if isinstance(vect, _Vec3):
        #    pass
            #self.thisptr.Diagonalize(vect.thisptr[0])
        self.thisptr.Diagonalize(vect)
