# distutils: language = c++
from .DataSet_1D cimport DataSet_1D, _DataSet_1D
from .DataSet_double cimport DataSet_double, _DataSet_double
from .DataSet cimport DataSet, _DataSet

def cast_dataset(DataSet dset, dtype=None):
    """create memory for DataSet instance"""
    # TODO : how to combine?
    cdef DataSet_1D newset1D
    cdef DataSet_double newset_double

    if dtype == 'dataset_1d':
        newset1D = DataSet_1D()
        # need to recast baseptr0
        newset1D.baseptr0 =  dset.baseptr0
        # need to recast baseptr_1
        newset1D._recast_pointers(0)
        return newset1D

    elif dtype == 'dataset_double':
        newset_double = DataSet_double()
        # since we introduce memory view, we let cpptraj free memory
        newset_double.py_free_mem = False
        newset_double.baseptr0 = dset.baseptr0
        # make sure other pointers pointing to the same address
        newset_double.baseptr_1 = <_DataSet_1D*> dset.baseptr0
        newset_double.thisptr = <_DataSet_double*> dset.baseptr0
        return newset_double
