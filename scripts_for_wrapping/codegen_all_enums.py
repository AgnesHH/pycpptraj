import os
from codegen_enum import create_enum_of_dict
from find_class_name import find_class

for fname in find_class():
    fname = fname + ".h"
    cpptrajsrc = os.environ['AMBERHOME'] + "AmberTools/src/cpptraj/src/"
    fname_full = cpptrajsrc + fname
    if os.path.exists(fname_full):
        create_enum_of_dict(fname, mode='dict')
