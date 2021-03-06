import unittest
from pycpptraj.misc import randomize_ions
from pycpptraj.io import load

class TestRandomizeIons(unittest.TestCase):
    def test_0(self):
        # get `traj` instance (FrameArray)
        traj = load(filename="./Test_RandomizeIons/adh206.tip3p.rst7.gz", 
                    top="./Test_RandomizeIons/adh206.ff10.tip3p.parm7.gz")
        # get 1st frame from `traj`
        frame0 = traj[0]
        
        # randomize ions for frame0
        randomize_ions(frame0,
                       traj.top,
                       command="randomizeions @Na+ around :1-16 by 5.0 overlap 3.0",)
        
        # make sure to reproduce cpptraj output
        savedframe = load(filename="./Test_RandomizeIons/random.crd.save",
                          top="./Test_RandomizeIons/adh206.ff10.tip3p.parm7.gz")[0]
        
        assert frame0.rmsd(savedframe) < 1E-3

if __name__ == "__main__":
    unittest.main()
