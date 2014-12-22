# distutils: language = c++


cdef class DataSet_1D (DataSet):
    # TODO: correct argument's name
    def __cinit__(self):
        # make sure two pointers pointing to the same address
        self.baseptr_1 = <_DataSet_1D*> self.baseptr_0

    def __dealloc__(self):
        pass

    def copy(self, DataSe dset):


    def allocate_1D(self, size_t sizet):
        return self.basepptr_1.Allocate1D(sizet)

    def write_buffer(self, CpptrajFile cppfile, size_t sizet):
        self.baseptr_1.WriteBuffer(cppfile.thisptr[0], sizet)

    def d_val(self, size_t sizet):
        return self.baseptr_1.Dval(sizet)

    def xcrd(self, size_t sizet):
        return self.baseptr_1.Xcrd(sizet)

    def IsTorsionArray(self):
        return self.baseptr_1.IsTorsionArray()

    def Avg(self, *args):
        cdef[:] sd
        if not args:
            return self.baseptr_1.Avg()
        else:
            sd[:] = args
            return self.baseptr_1.Avg(&sd[0])

    def Min(self):
        return self.baseptr_1.Min()

    def Max(self):
        return self.baseptr_1.Max()

    def CrossCorr(self, DataSet_1D D2, DataSet_1D Ct, int lagmaxIn, bint calccovar, bint usefft):
        return self.baseptr_1.CrossCorr(D2.baseptr_1[0], Ct.baseptr_1[0], lagmaxIn, calccovar, usefft)

    def CorrCoeff(self, DataSet_1D other):
        return self.baseptr_1.CorrCoeff(other.thisptr[0])

