# distutils: language = c++

# (C) Hai Nguyen - 2014
# Translate from cpptraj (C++): ./Action_PairDist.cpp to Cython code
# cpptraj was written by Dan R. Roe

cdef class Action_PairDist(ImagedAction):
    cdef:
          Public CpptrajFile output
          Public AtomMask mask1
          Public AtomMask mask2
          Public double delta        
          Public vector[Stats[double]] histogram
          Public unsigned long maxbin
          Public bint same_mask
          Public unsigned long ub1
          Public unsigned long ub2

    def __cinit__(self, double delta, unsigned long maxbin,
                  bint same_mask, unsigned long ub1, unsigned ub2):
        self.delta = delta
        self.maxbin = maxbin
        self.same_mask = same_mask
        self.ub1 = ub1
        self.ub2 = ub2

    def Help(self):
        pass

    def Initialize(self, ArgList& actionArgs, TopologyList* PFL,
                         FrameList* FL, DataSetList* DSL,
                         DataFileList* DFL,
                         int debugIn):

        cdef string outfileName
        outfileName = actionArgs.GetStringKey("out")
        if outfileName.empty():
            outfileName = "pairdist.dat"

        self.InitImaging(True)

        if self.output.OpenEnsembleWrite(outfileName, DSL.EnsembleNum()):
            print("Error")
            return Action.ERR

        mask1 = actionArgs.GetStringKey("mask")
        if mask1.empty():
            print("Error")
            return Action.ERR
        self.mask1.SetMaskString(mask1)
        
        mask2 = actionArgs.GetStringKey("mask2")
        if mask2.empty():
            self.same_mask = True
            self.mask2.SetMaskString(mask1)
        else:
            self.mask1.SetMaskString(mask2)
            if self.mask1.MaskExpression() != self.mask2.MaskExpression():
                self.same_mask = False
            else:
                self.same_mask = True

        self.delta = actionArgs.getKeyDouble("delta", 0.01)
        return Action.OK
        

    def Setup(self, Topology* currentParm, Topology** parmAddress):

        if currentParm.SetupIntegerMask(self.mask1):
            return Action.ERR

        self.mask1.BriefMaskInfo()
        if self.mask1.None():
            print("Error")
            return Action.ERR

        self.mask2.BriefMaskInfo()
        if self.mask2.None():
            print("Error")
            return Action.ERR

        if self.mask1.MaskExpression() != self.mask2.MaskExpression() and self.mask1.NumAtomsInCommon(self.mask2) > 0:
            print("Error")
            return Action.ERR

        if self.same_mask:
            self.ub1 = self.mask1.Nselected() - 1
            self.ub2 = self.mask1.Nselected()
        else:
            self.ub1 = self.mask1.Nselected()
            self.ub2 = self.mask2.Nselected()

        SetupImaging(currentParm.BoxType())
        return Action.OK

    def do_action(self, int frameNum, Frame* currentFrame, Frame** frameAddress ):
        cdef:
            unsigned long binnum, i, j
            double Dist = 0.0
            Matrix_3x3 ucell, recip
            Vec3 a1, a2
            vector[double] tmp
        tmp.resize(self.histogram.size()) 

        for i in range(self.ub1):
            start = i + 1 if self.same_mask else 0
            for j in range(start, self.ub2):
                a1 = currentFrame.XYZ(self.mask1[i])
                a2 = currentFrame.XYZ(self.mask2[j])
                if ImageType() == NONORTHO:
                    currentFrame.BoxCrd().ToRecip(ucell, recip)
                    Dist = DIST2_ImageNonOrtho(a1, a2, ucell, recip)
                    #break
                elif ImageType() == ORTHO:
                    Dist = DIST2_ImageOrtho(a1, a2, currentFrame.BoxCrd())
                    #break
                elif ImageType()  == NOIMAGE:
                    Dist = DIST2_NoImage(a1, a2)
                    #break

                binnum = sqrt(Dist) / self.delta
                if binnum > self.maxbin:
                    self.maxbin = binnum
                    tmp.resize(self.maxbin + 1)
                    self.histogram.resize(self.maxbin + 1)
                tmp[binnum]++

        for i in range(tmp.szie()):
            self.histogram[i].accumulate(tmp[i])
        return Action.OK

    def print(self):
        cdef double dist, Pr, st
        self.output.Printf("#TODO add info here")

        for i in range(self.histogram.size()):
            Pr = self.histogram[i].mean() / delta
            if Pr > 0.0:
                dist = (i + 0.5) * delta
                sd = sqrt(self.histogram[i].variance())
                self.output.Printf("%10.4f %16.2f %10.2f\n", dist, Pr, sd)
