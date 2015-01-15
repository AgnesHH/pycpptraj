import unittest
from pycpptraj.parms.ParmFile import ParmFile
from pycpptraj.Topology import Topology
from pycpptraj.decorators import not_yet_supported

def test_generator(top):
   for atom in top.atoms():
       pass
       #print atom
   
   print "\nres_iterator for top"
   for res in top.residues():
       pass
       #print res
   
   print "\nmol_iterator for top"
   for mol in top.mols():
       pass
       #print mol
   
   for i in range(304):
       top.atom_mask_name(i)

top = Topology()
parm = ParmFile()
fname = "./data/Tc5b.top"
parm.readparm(top, fname)
assert top.n_atoms == 304
parm.help()

class TestParmFile(unittest.TestCase):

    def test_0(self):
        top = Topology()
        parm = ParmFile()
        print parm.formats()
        
        fname = "./data/Tc5b.top"
        
        print "Read topology file and dump to 'top'"
        parm.readparm(top, fname)
        assert top.n_atoms == 304
        
        print "\natom_iterator for top"
        
        print parm.filename()

    def test_write_CHARMMPSF(self):
        print "write parm for CHARMM"
        parm.writeparm(top=top, fname="output/test.psf", fmt="CHARMMPSF")
        top2 = Topology()
        parm.readparm(fname="output/test.psf", top=top2)
        assert top2.n_atoms == 304
        test_generator(top2)

    def test_write_AMBERPARM(self):
        top2 = Topology()
        parm.writeparm(top=top, fname="output/test.parm7", fmt="AMBERPARM")
        parm.readparm(fname="output/test.parm7", top=top2)
        assert top2.n_atoms == 304
        test_generator(top2)

    #@not_yet_supported
    def test_write_GROMACS(self):
        top2 = Topology()
        parm.writeparm(top=top, fname="output/test.gmxtop", fmt="GMXTOP")
        #parm.readparm(fname="output/test.gmxtop", top=top2)
        #assert top2.n_atoms == 304
        #test_generator(top2)

    #@not_yet_supported
    def test_write_mol2(self):
        top2 = Topology()
        parm.writeparm(top=top, fname="output/test.mol2", fmt="MOL2FILE")
        #parm.readparm(fname="output/test.mol2", top=top2)
        #assert top2.n_atoms == 304
        #test_generator(top2)

    #@not_yet_supported
    def test_write_TINKER(self):
        top2 = Topology()
        parm.writeparm(top=top, fname="output/test.arc", fmt="TINKER")
        #parm.readparm(fname="output/test.arc", top=top2)
        #assert top2.n_atoms == 304
        #test_generator(top2)

if __name__ == "__main__":
    unittest.main()
