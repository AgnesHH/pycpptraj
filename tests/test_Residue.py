import os
import unittest
import pycpptraj
from pycpptraj.base import *
from pycpptraj.Residue import Residue

class TestResidue(unittest.TestCase):
    def test_0(self):
        top = Topology("./data/Tc5b.top")
        print top.residuelist(mode="instance")[0].first_atom
        print top.residuelist(mode="instance")[0].last_atom
        print top.residuelist(mode="instance")[0].n_atoms

        print top.residuelist(mode="instance")[10].first_atom
        print top.residuelist(mode="instance")[10].last_atom
        print top.residuelist(mode="instance")[10].n_atoms

        print dir(top.atomlist[0])
        anames = [atom.__str__() for atom in top.atomlist]
        print anames

    def test_1(self):
        datadir = "./data/"
        tl = TopologyList()
        tl.add_parm(datadir + "Tc5b.top")
        tl.add_parm(datadir + "HP36.top")
        #tl.List()
        top = tl.get_parm(1)
        
        print "get 1st residue"
        res1 = top.residues.next()
        
        # get residue's name
        print res1
        #print help(res1)
        # extract residue info
        print "1st atom: %s" % res1.first_atom
        print "last atom: %s" % res1.last_atom
        print res1.original_res_num
        #print res1.c_str()
        #print res1.Name()
        print res1.n_atoms
        #print res1.NameIsSolvent()
        
        # print all residue's name in top file
        #for res in top.residues():
        #    print res
        
        # test iterator
        gen = top.residues
        print gen.next()
        print gen.next()
        print gen.next()
        print gen.next()
        print gen.next()
        print gen.next()
        
if __name__ == '__main__':
    unittest.main()
