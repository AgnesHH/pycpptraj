from pycpptraj.DataSetList import DataSetList
#from pycpptraj.cpptraj_dict import DataTypeDict
from pycpptraj.DataSet import DataSet

#print DataTypeDict
dlist = DataSetList()
dset = dlist.find_set_of_type("./data/md1_prod.Tc5b.x", "TRAJ")
print dset.data_format
print dir(dset)
