# distutils: language = c++

cdef class Dimension:

    def __cinit__(self):
        """Add more args to function"""
        self.thisptr = new _Dimension()
        pass

    def __dealloc__(self):
        del self.thisptr

    def SetLabel(self, string label):
        self.thisptr.SetLabel(label)

    def SetMin(self, double x):
        self.thisptr.SetMin(x)

    def SetMax(self, double x):
        self.thisptr.SetMax(x)

    def SetStep(self, double x):
        self.thisptr.SetStep(x)
    
    def SetBins(self, int bins):
        self.SetBins(bins)

    property Label:
        def __get__(self):
            return self.thisptr.Label()

    property Min:
        def __get__(self):
            return self.thisptr.Min()

    property Max:
        def __get__(self):
            return self.thisptr.Max()
    
    property Step:
        def __get__(self):
            return self.thisptr.Step()

    property Bins:
        def __get__(self):
            return self.thisptr.Bins()

    def MinIsSet(self):
        return self.thisptr.MinIsSet()

    def MaxIsSet(self):
        return self.thisptr.MaxIsSet()

    def Coord(self, size_t x):
        return self.thisptr.Coord(x)

    def CalcBinsOrStep(self):
        return self.thisptr.CalcBinsOrStep()

    def PrintDim(self):
        self.thisptr.PrintDim()
    
