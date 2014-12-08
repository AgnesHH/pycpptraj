import os
from distutils.core import setup
from distutils.extension import Extension
import Cython.Distutils.build_ext
from Cython.Build import cythonize

rootname = "/mnt/raidc2/haichit/Study/Cython/pycpptraj"
pycpptraj_home = rootname + "/pycpptraj/"

try:
    cpptraj_dir = cpptraj_include = os.environ['AMBERHOME'] + "/AmberTools/src/cpptraj/src/"
    libdir = os.environ['AMBERHOME'] + "/lib"
except:
    raise EnvironmentError("Must set AMBERHOME")

rootname = "test_enum_to_dict.pyx".split(".")[0]
print rootname
setup(
      ext_modules = cythonize([
          Extension(rootname, ["test_enum_to_dict.pyx",],
                    libraries=['cpptraj'],
                    include_dirs=[cpptraj_include, pycpptraj_home],
                    library_dirs=[libdir,],
                    language = 'c++',
                    )
          ])
     )

