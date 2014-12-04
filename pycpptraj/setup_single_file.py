import os
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

PXD_include = os.environ['PYCPPTRAJ_HOME'] + "/PXD/"
cpptraj_include = os.environ['AMBERHOME'] + "/AmberTools/src/cpptraj/src/"
netcdf_include = os.environ['AMBERHOME'] + "/lib/"

setup(
      ext_modules = cythonize([
          Extension("*", ["TopologyList.pyx",],
                    libraries=['cpptraj'],
                    library_dirs=[cpptraj_include,],
                    include_dirs=[PXD_include, cpptraj_include, netcdf_include])
          ])
     ) 