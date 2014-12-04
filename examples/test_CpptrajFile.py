import os
from pycpptraj.CpptrajFile import CpptrajFile

cfile = CpptrajFile()

fname = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/md1_prod.x"
print fname
cfile.OpenRead(fname)
cfile.IsCompressed()
cfile.UncompressedSize()
cfile.CloseFile()
