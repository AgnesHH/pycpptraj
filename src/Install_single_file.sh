#!/bin/sh

pyxfile=$1

cat >setup_single_file.py <<EOF
import os
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

PXD_include = os.environ['PYCPPTRAJ_HOME'] + "/PXD/"
cpptraj_include = os.environ['AMBERHOME'] + "/AmberTools/src/cpptraj/src/"
netcdf_include = os.environ['AMBERHOME'] + "/lib/"

setup(
      ext_modules = cythonize([
          Extension("*", ["$pyxfile",],
                    libraries=['cpptraj'],
                    library_dirs=[cpptraj_include,],
                    include_dirs=[PXD_include, cpptraj_include, netcdf_include])
          ])
     ) 
EOF

python ./setup_single_file.py build_ext -i
