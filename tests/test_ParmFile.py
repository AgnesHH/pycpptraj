import unittest
from pycpptraj.parms.ParmFile import ParmFile
from pycpptraj.Topology import Topology
from pycpptraj.decorators import not_yet_supported
from pycpptraj import io as mdio

def test_generator(top):
   for atom in top.atoms:
       pass
       #print atom
   
   print "\nres_iterator for top"
   for res in top.residues:
       pass
       #print res
   
   print "\nmol_iterator for top"
   for mol in top.mols:
       pass
       #print mol
   
   for i in range(304):
       top.atom_mask_name(i)

top = Topology()
parm = ParmFile()
filename = "./data/Tc5b.top"
parm.readparm(top, filename)
assert top.n_atoms == 304
parm.help()

class TestParmFile(unittest.TestCase):
    def test_readpdb(self):
        print "test_readpdb +++++++++++++++++++++++++++++++"
        pdbtop = mdio.readparm("./test_0_after.pdb")
        assert pdbtop.n_atoms == 304
        print pdbtop.n_atoms
        top2 = pdbtop.copy()
        top2.strip_atoms("!@CA")
        print top2.n_atoms
        assert top2.n_atoms == 20

    def test_0(self):
        top = Topology()
        parm = ParmFile()
        print parm.formats()
        
        filename = "./data/Tc5b.top"
        
        print "Read topology file and dump to 'top'"
        parm.readparm(top, filename)
        assert top.n_atoms == 304
        
        print "\natom_iterator for top"
        
        print parm.filename()

    def test_write_CHARMMPSF(self):
        print "write parm for CHARMM"
        parm.writeparm(top=top, filename="output/test.psf", fmt="CHARMMPSF")
        top2 = Topology()
        parm.readparm(filename="output/test.psf", top=top2)
        assert top2.n_atoms == 304
        test_generator(top2)

    def test_write_AMBERPARM(self):
        top2 = Topology()
        parm.writeparm(top=top, filename="output/test.parm7", fmt="AMBERPARM")
        parm.readparm(filename="output/test.parm7", top=top2)
        assert top2.n_atoms == 304
        test_generator(top2)

    #@not_yet_supported
    def test_write_GROMACS(self):
        top2 = Topology()
        parm.writeparm(top=top, filename="output/test.gmxtop", fmt="GMXTOP")
        #parm.readparm(filename="output/test.gmxtop", top=top2)
        #assert top2.n_atoms == 304
        #test_generator(top2)

    #@not_yet_supported
    def test_write_mol2(self):
        top2 = Topology()
        parm.writeparm(top=top, filename="output/test.mol2", fmt="MOL2FILE")
        #parm.readparm(filename="output/test.mol2", top=top2)
        #assert top2.n_atoms == 304
        #test_generator(top2)

    #@not_yet_supported
    def test_write_TINKER(self):
        top2 = Topology()
        parm.writeparm(top=top, filename="output/test.arc", fmt="TINKER")
        #parm.readparm(filename="output/test.arc", top=top2)
        #assert top2.n_atoms == 304
        #test_generator(top2)

if __name__ == "__main__":
    unittest.main()
