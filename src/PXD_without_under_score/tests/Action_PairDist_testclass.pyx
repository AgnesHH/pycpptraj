# distutils: language = c++

# (C) Hai Nguyen - 2014
# Translate from cpptraj (C++): ./Action_PairDist.cpp to Cython code
# cpptraj was written by Dan R. Roe

from math import sqrt
from libcpp.string cimport string
from libcpp.vector cimport vector
from Action cimport OK as ActionOK
from Action cimport ERR as ActionERR
from ImagedAction cimport *
from Topology cimport *
from TopologyList cimport *
from Frame cimport *
from FrameList cimport *
from DataFileList cimport *
from DataSetList cimport *
from Vec3 cimport Vec3
from AtomMask cimport AtomMask
from CpptrajFile cimport *
from OnlineVarT cimport Stats

cdef class Action_PairDist_(ImagedAction):
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

    def __cinit__(self, double delta, unsigned long maxbin,
                  bint same_mask, unsigned long ub1, unsigned ub2):
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
            return ActionERR

        mask1 = actionArgs.GetStringKey("mask")
        if mask1.empty():
            print("Error")
            return ActionERR
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
        return ActionOK
        

    cdef Setup(self, Topology* currentParm, Topology** parmAddress):

        if currentParm.SetupIntegerMask(self.mask1):
            return ActionERR

        self.mask1.BriefMaskInfo()
        if self.mask1.None():
            print("Error")
            return ActionERR

        self.mask2.BriefMaskInfo()
        if self.mask2.None():
            print("Error")
            return ActionERR

        if self.mask1.MaskExpression() != self.mask2.MaskExpression() and self.mask1.NumAtomsInCommon(self.mask2) > 0:
            print("Error")
            return ActionERR

        if self.same_mask:
            self.ub1 = self.mask1.Nselected() - 1
            self.ub2 = self.mask1.Nselected()
        else:
            self.ub1 = self.mask1.Nselected()
            self.ub2 = self.mask2.Nselected()

        self.SetupImaging(currentParm.BoxType())
        return ActionOK

    cdef do_action(self, int frameNum, Frame* currentFrame, Frame** frameAddress ):
        cdef:
            unsigned long binnum, i, j
            double Dist = 0.0
            Matrix_3x3 ucell, recip
            Vec3 *a1, *a2
            vector[double] tmp
        tmp.resize(self.histogram.size()) 

        for i in range(self.ub1):
            start = i + 1 if self.same_mask else 0
            for j in range(start, self.ub2):
                a1 = currentFrame.XYZ(self.mask1[i])
                a2 = currentFrame.XYZ(self.mask2[j])
                if self.ImageType() == NONORTHO:
                    currentFrame.BoxCrd().ToRecip(ucell, recip)
                    Dist = DIST2_ImageNonOrtho(a1, a2, ucell, recip)
                    #break
                elif self.ImageType() == ORTHO:
                    Dist = DIST2_ImageOrtho(a1, a2, currentFrame.BoxCrd())
                    #break
                elif self.ImageType()  == NOIMAGE:
                    Dist = DIST2_NoImage(a1, a2)
                    #break

                binnum = sqrt(Dist) / self.delta
                if binnum > self.maxbin:
                    self.maxbin = binnum
                    tmp.resize(self.maxbin + 1)
                    self.histogram.resize(self.maxbin + 1)
                tmp[binnum] += 1

        for i in range(tmp.szie()):
            self.histogram[i].accumulate(tmp[i])
        return ActionOK

    #cdef print(self):
    #    cdef double dist, Pr, st
    #    self.output.Printf("#TODO add info here")

    #    for i in range(self.histogram.size()):
    #        Pr = self.histogram[i].mean() / delta
    #        if Pr > 0.0:
    #            dist = (i + 0.5) * delta
    #            sd = sqrt(self.histogram[i].variance())
    #            self.output.Printf("%10.4f %16.2f %10.2f\n", dist, Pr, sd)
