import unittest
from pycpptraj.parms.ParmFile import ParmFile
from pycpptraj.Topology import Topology

print ParmFile.formats
def test_generator(top):
   for atom in top.atom_generator():
       pass
       #print atom
   
   print "\nres_iterator for top"
   for res in top.res_generator():
       pass
       #print res
   
   print "\nmol_iterator for top"
   for mol in top.mol_generator():
       pass
       #print mol
   
   for i in range(304):
       top.atom_mask_name(i)

class TestParmFile(unittest.TestCase):

    def test_0(self):
        top = Topology()
        parm = ParmFile()
        parm.help()
        
        fname = "./data/Tc5b.top"
        
        print "Read topology file and dump to 'top'"
        parm.readparm(top, fname)
        assert top.n_atoms == 304
        
        print "\natom_iterator for top"
        
        print parm.filename()
        
        # write parm
        # CHARMMPSF
        parm.writeparm(top=top, fname="test.psf", fmt="CHARMMPSF")
        # read again
        top2 = Topology()
        parm.readparm(fname="test.psf", top=top2)
        assert top2.n_atoms == 304
        test_generator(top2)

        # AMBER
        top2 = Topology()
        parm.writeparm(top=top, fname="test.top")
        parm.readparm(fname="test.top", top=top2)
        assert top2.n_atoms == 304
        test_generator(top2)

if __name__ == "__main__":
    unittest.main()
