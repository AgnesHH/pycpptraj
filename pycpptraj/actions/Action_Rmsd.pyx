# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class Action_Rmsd (Action):
    def __cinit__(self):
        self.thisptr = <_Action*> new _Action_Rmsd()
        self.ptr = <_Action_Rmsd*> self.thisptr

    def __dealloc__(self):
        if self.thisptr is not NULL:
            del self.thisptr

    #def alloc(cls):
    #    cdef DispatchObject dpobject = DispatchObject()
    #    dpobject.thisptr[0] = deref(self.ptr.Alloc())
    #    return dpobject

    #def help(cls):
    #    self.ptr.Help()

    #@classmethod
    #def alloc(cls):
    # got "Invalid operand type for '*' (Python object)"
    # deref(cls.ptr.Alloc())
    #    cdef DispatchObject dpobject = DispatchObject()
    #    dpobject.thisptr[0] = deref(cls.ptr.Alloc())
    #    return dpobject

    #@classmethod
    #def help(cls):
    #    cls.ptr.Help()
