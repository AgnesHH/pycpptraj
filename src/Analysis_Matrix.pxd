# distutil: language = c++

from Analysis cimport *
from DataSet_2D cimport *
from DataSet_Modes cimport *

cdef extern from "Analysis_Matrix.h":
    cdef cppclass Analysis_Matrix:
        Analysis_Matrix()
        void Help()
        RetType Setup(ArgList&, DataSetList*, TopologyList*, DataSetList*,
                      int)
        RetType Analyze()

        #private from cpptraj
        int NMWizOutput() const
        DataSet_2D* matrix_
        DataSet_Modes* modes_
        cstring outthermo_
        double thermo_temp_
        int nevec_
        bint thermopt_
        bint reduce_
        bint eigenvaluesOnly_
        bint nmwizopt_
        int nmwizvecs_
        cstring nmwizfile_
        Topology nmwizParm_
        
