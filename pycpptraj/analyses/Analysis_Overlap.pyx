# distutils: language = c++
from cython.operator cimport dereference as deref


cdef class Analysis_Overlap (Analysis):
    def __cinit__(self):
        self.baseptr = <_Analysis*> new _Analysis_Overlap()
        self.thisptr = <_Analysis_Overlap*> self.baseptr

    def __dealloc__(self):
        if self.baseptr is not NULL:
            del self.baseptr

    def alloc(self):
        """return a function-pointer object to be used with AnalysisList class
        """
        cdef FunctPtr func = FunctPtr()
        func.ptr = &(self.thisptr.Alloc)
        return func
        
    def help(self):
        self.thisptr.Help()
