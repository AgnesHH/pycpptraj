import os
from glob import glob
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

pycpptraj_home = os.environ['PYCPPTRAJ_HOME']
PXD_include = pycpptraj_home + "/PXD/"
cpptraj_include = os.environ['AMBERHOME'] + "/AmberTools/src/cpptraj/src/"

# get *.pyx list
pyxfiles = []
with open("PYXLIST.txt", 'r') as f:
    for line in f.readlines():
        if "#" not in line:
            pyxfiles.append(line.split("\n")[0])

pyxfiles = [pycpptraj_home + f for f in pyxfiles]

setup(
      ext_modules = cythonize([
          Extension("*", pyxfiles,
                    libraries=['cpptraj'],
                    library_dirs=[cpptraj_include,],
                    include_dirs=[PXD_include, cpptraj_include])
          ])
     ) 
