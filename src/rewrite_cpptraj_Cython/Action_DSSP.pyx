# distutils: language = c++

cdef class Action_DSSP:
    cdef: 
        double DSSP_fac 
        debug_
        outfile_
        dssp_
        Nres_
        Nframe_
        SSline_
        printString_
        masterDSL_
        BB_N
        BB_H
        BB_C
        BB_O

    def __cinit__(self):
        self.DSSP_fac = 27.888
        #initilaize parameters here

    def Help(self):
        pass
    


