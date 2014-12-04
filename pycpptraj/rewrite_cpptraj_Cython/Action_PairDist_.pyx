# distutils: language = c++

# (C) Hai Nguyen - 2014
# Translate from cpptraj (C++): ./Action)PairDist.cpp to Cython code
# cpptraj was written by Dan R. Roe
from math import sqrt
from Action cimport *
from DistRoutines cimport *
from ImagedAction_ cimport ImagedAction_
from CpptrajFile cimport *
from AtomMask cimport *
from ArgList cimport *
from TopologyList cimport *
from Topology cimport *
from FrameList cimport *
from Frame cimport *
from DataFileList cimport *
from DataSetList cimport *
from OnlineVarT cimport Stats

cdef class Action_PairDist(ImagedAction_):
    cdef:
          CpptrajFile output
          AtomMask mask1
          AtomMask mask2
          double delta        
          vector[Stats[double]] histogram
          unsigned long maxbin
          bint same_mask
          unsigned long ub1
          unsigned long ub2

    def __cinit__(self, double delta=0.0, unsigned long maxbin=100,
                  bint same_mask=False, unsigned long ub1=10, unsigned ub2=100):
        self.delta = delta
        self.maxbin = maxbin
        self.same_mask = same_mask
        self.ub1 = ub1
        self.ub2 = ub2

    cdef Help(self):
        pass

    cdef Initialize(self, ArgList& actionArgs, TopologyList* PFL,
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
            return aERR

        mask1 = actionArgs.GetStringKey("mask")
        if mask1.empty():
            print("Error")
            return aERR
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
        return aOK
        

    cdef Setup(self, Topology* currentParm, Topology** parmAddress):

        if currentParm.SetupIntegerMask(self.mask1):
            return aERR

        self.mask1.BriefMaskInfo()
        if self.mask1.None():
            print("Error")
            return aERR

        self.mask2.BriefMaskInfo()
        if self.mask2.None():
            print("Error")
            return aERR

        if self.mask1.MaskExpression() != self.mask2.MaskExpression() and self.mask1.NumAtomsInCommon(self.mask2) > 0:
            print("Error")
            return aERR

        if self.same_mask:
            self.ub1 = self.mask1.Nselected() - 1
            self.ub2 = self.mask1.Nselected()
        else:
            self.ub1 = self.mask1.Nselected()
            self.ub2 = self.mask2.Nselected()

        self.SetupImaging(currentParm.BoxType())
        return aOK

    cdef do_action(self, int frameNum, Frame* currentFrame, Frame** frameAddress ):
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
                a1.Assign(currentFrame.XYZ(self.mask1[i]))
                a2.Assign(currentFrame.XYZ(self.mask2[j]))
                if self.imageType == dNONORTHO:
                    currentFrame.BoxCrd().ToRecip(ucell, recip)
                    Dist = DIST2_ImageNonOrtho(a1, a2, ucell, recip)
                    #break
                elif self.imageType == dORTHO:
                    Dist = DIST2_ImageOrtho(a1, a2, currentFrame.BoxCrd())
                    #break
                elif self.imageType  == dNOIMAGE:
                    Dist = DIST2_NoImage(a1, a2)
                    #break

                binnum = sqrt(Dist) / self.delta
                if binnum > self.maxbin:
                    self.maxbin = binnum
                    tmp.resize(self.maxbin + 1)
                    self.histogram.resize(self.maxbin + 1)
                tmp[binnum] += 1

        for i in range(tmp.size()):
            self.histogram[i].accumulate(tmp[i])
        return aOK

    def print_info(self):
        cdef double dist, Pr, st
        self.output.Printf("#TODO add info here")

        for i in range(self.histogram.size()):
            Pr = self.histogram[i].mean() / self.delta
            if Pr > 0.0:
                dist = (i + 0.5) * self.delta
                sd = sqrt(self.histogram[i].variance())
                #self.output.Printf("%10.4f %16.2f %10.2f\n", dist, Pr, sd)
