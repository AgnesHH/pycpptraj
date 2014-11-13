#rewrite cpptraj with cython

#to save time, I don't add types for variables yet
cdef class DataIO:
    def __cinit__(self):
        pass

    def check_valid_for(self, DataSet dataIn):
        pass

    def setup_coord_formart(self, maxFrames, dim, default_width, default_precision):
        """add doc here"""

    def get_Xdim(self, Xvals):
        """
        Parameters:
        Xvals : vector of double

        Output:
        Xdim
        """
        pass



