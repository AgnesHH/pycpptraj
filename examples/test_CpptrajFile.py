import os
from pycpptraj.CpptrajFile import CpptrajFile
tdict = CpptrajFile.typedict

cfile = CpptrajFile()

fname = os.environ['PYCPPTRAJ_HOME'] + "/examples/data/md1_prod.x"
#print fname
#status = cfile.OpenRead(fname)
print cfile.typedict("FileType")[1]
print cfile.typedict(tdict="CompressType")[1]
print tdict("CompressType").keys()
#print status
#magic = cfile.Read('', 10)[0]
#print magic
#print cfile.IsCompressed()
#print cfile.UncompressedSize()
#cfile.CloseFile()
