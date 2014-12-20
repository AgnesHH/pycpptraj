from pycpptraj.DataSetList import DataSetList
from pycpptraj.cpptraj_dict import DataTypeDict
from pycpptraj.DataSet import DataSet

print DataTypeDict
dlist = DataSetList()
dset = dlist.find_coords_set("./data/md1_prod.Tc5b.x")
print dset.idx
