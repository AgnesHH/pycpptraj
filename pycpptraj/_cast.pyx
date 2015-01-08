# distutils: language = c++
from dataset.DataSet_1D cimport DataSet_1D, _DataSet_1D
from dataset.DataSet_2D cimport DataSet_2D, _DataSet_2D
from dataset.DataSet_double cimport DataSet_double, _DataSet_double
from dataset.DataSet_MatrixDbl cimport DataSet_MatrixDbl, _DataSet_MatrixDbl
from dataset.DataSet cimport DataSet, _DataSet

def cast_dataset(DataSet dset, dtype=None):
    """create memory for DataSet instance"""
    # TODO : how to combine?
    cdef DataSet_1D newset1D
    cdef DataSet_2D newset2D
    cdef DataSet_double newset_double
    cdef DataSet_MatrixDbl newset_MatrixDbl

    if dtype == 'dataset_1d':
        newset1D = DataSet_1D()
        # need to recast baseptr0
        newset1D.baseptr0 =  dset.baseptr0
        # need to recast baseptr_1
        newset1D._recast_pointers(0)
        return newset1D
    if dtype == 'dataset_2d':
        newset2D = DataSet_2D()
        newset2D.baseptr0 = <_DataSet*> dset.baseptr0
        newset2D.baseptr_1 = <_DataSet_2D*> dset.baseptr0
        return newset2D
    elif dtype == 'dataset_double':
        newset_double = DataSet_double()
        # since we introduce memory view, we let cpptraj free memory
        newset_double.py_free_mem = False
        newset_double.baseptr0 = dset.baseptr0
        # make sure other pointers pointing to the same address
        newset_double.baseptr_1 = <_DataSet_1D*> dset.baseptr0
        newset_double.thisptr = <_DataSet_double*> dset.baseptr0
        return newset_double
    elif dtype == 'dataset_matrixdbl':
        newset_matrixdbl = DataSet_MatrixDbl()
        # since we introduce memory view, we let cpptraj free memory
        newset_matrixdbl.py_free_mem = False
        newset_matrixdbl.baseptr0 = dset.baseptr0
        # make sure other pointers pointing to the same address
        newset_matrixdbl.baseptr_1 = <_DataSet_2D*> dset.baseptr0
        newset_matrixdbl.thisptr = <_DataSet_MatrixDbl*> dset.baseptr0
        return newset_matrixdbl
