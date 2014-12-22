# distutils: language = c++
from DataSet_1D cimport DataSet_1D, _DataSet_1D
from DataSet cimport DataSet, _DataSet
# casting 

def cast_dataset(DataSet dset, dtype=None):
    if dtype == "dataset_1d":
        newset = DataSet_1D()
        # create memory view
        # need to recast baseptr0
        newset.baseptr0 =  dset.baseptr0
        # need to recast baseptr_1
        newset._recast_pointers()

        # debug
        #print "yes, newset has baseptr0, (before checking)"
        #if newset.baseptr0:
        #    print "yes, newset has baseptr0, (after checking)"
        #if newset.baseptr_1:
        #    print "yes, newset has baseptr_1, (after checking)"
    return newset
