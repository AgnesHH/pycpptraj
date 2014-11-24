# distutils: language = c++

from libcpp.string cimport string
from FileName cimport *

cdef class Topology:
    def __cinit__(self):
        self.thisptr = new _Topology()

    def __dealloc__(self):
        del self.thisptr

    def SetParmName(self, string title, FileName filename):
        self.thisptr.SetParmName(title, filename)

    def SetReferenceCoords(self, Frame frameIn):
        self.thisptr.SetReferenceCoords(frameIn)

    def FinalSoluteRes(self):
        return self.thisptr.FinalSoluteRes()

    def c_str(self):
        return self.thisptr.c_str()

    def TruncResAtomName(self, int atom):
        return self.thisptr.TruncResAtomName(atom)

    def AtomMaskName(self, int atom):
        return self.thisptr.AtomMaskName(atom)

    def TruncResNameNum(self, int res):
        return self.thisptr.TruncResNameNum(res)

    def FindAtomInResidue(self, int res, NameType atname):
        return self.thisptr.FindAtomInResidue()
    
    def FindResidueMaxNatom(self):
        return self.thisptr.FindResidueMaxNatom()
    
    def SoluteAtoms(self):
        return self.thisptr.SoluteAtoms()

    def Summary(self):
        self.thisptr.Summary()

    def Brief(self, char* heading):
        self.thisptr.Brief(heading)

    def PrintAtomInfo(self, string maskString):
        self.thisptr.PrintAtomInfo(maskString)

    def PrintBonds(self, BondArray barray, AtomMask maskIn, int nb):
        self.thisptr.PrintBonds(barray, maskIn, nb)

    def PrintBondInfo(self, string maskString):
        self.thisptr.PrintBondInfo(maskString)
    
    def PrintAngles(self):
        self.thisptr.PrintAngles()

    def PrintAngleInfo(self):
        self.thisptr.PrintAngleInfo()

    def PrintDihedrals(self):
        self.thisptr.PrintDihedrals()

    def PrintDihedralInfo(self):
        self.thisptr.PrintDihedralInfo()

    def PrintMoleculeInfo(self):
        self.thisptr.PrintMoleculeInfo()

    def PrintResidueInfo(self):
        self.thisptr.PrintResidueInfo()

    def PrintChargeMassInfo(self):
        self.thisptr.PrintChargeMassInfo()
    
    def AddTopAtom(self, Atom atomIn, int o_resnum, NameType  resname, double[:] XYZin):
        return self.thisptr.AddTopAtom(atomIn, o_resnum, resname, &XYZin[0])

    def StartNewMol(self):
        self.thisptr.StartNewMol()

    def CommonSetup(self, bint bondsearch):
        return self.thisptr.CommonSetup(bondsearch)

    def SetOffset(self, double x):
        self.thisptr.SetOffset(x)

    def SetIpol(self, int id):
        

    def NextraPts(self):
        pass

    def HasVelInfo(self):
        return self.thisptr.HasVelInfo()

    def OriginalFilename(self):
        cdef FileName fname = FileName()
        fname.thisptr[0] = self.thisptr.OriginalFilename()
        return fname

    property Pindex:
        def __get__(self):
            return self.thisptr.Pindex()

    property Natom:
        def __get__(self):
            return self.thisptr.Natom()

    property Nres:
        def __get__(self):
            return self.thisptr.Nres()

    property Nmol:
        def __get__(self):
            return self.thisptr.Nmol()

    property Nsolvent:
        def __get__(self):
            return self.thisptr.Nsolvent()

    property Nframes:
        def __get__(self):
            return self.thisptr.Nframes()

    property NrepDim:
        def __get__(self):
            return self.thisptr.NrepDim()

    property ParmName:
        def __get__(self):
            return self.thisptr.ParmName()

    property GBradiiSet:
        def __get__(self):
            return self.thisptr.GBradiiSet()

    property NoRefCoords:
        def __get__(self):
            return self.thisptr.NoRefCoords()

    property FinalSoluteRes:
        def __get__(self):
            return self.thisptr.FinalSoluteRes()

    def __iter__(self):
        """Use generator?"""
        pass
